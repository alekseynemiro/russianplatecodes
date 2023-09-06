import 'package:flutter/material.dart';
import 'package:rect_getter/rect_getter.dart';

import '../../models/region_code.dart';

typedef OnShownRegionCallback = void Function(RegionCode region);

class RegionCodeList extends StatefulWidget {

  final List<RegionCode> regions;

  final OnShownRegionCallback onShownRegion;

  const RegionCodeList({
    super.key,
    required this.regions,
    required this.onShownRegion
  });

  @override
  createState() => _RegionCodeListState();

}

class _RegionCodeListState extends State<RegionCodeList> {

  final Map<int, GlobalKey<RectGetterState>> _keys = {};
  final GlobalKey<RectGetterState> _listViewKey = RectGetter.createGlobalKey();

  @override
  Widget build(BuildContext context) {
    final regions = widget.regions;

    final listView = RectGetter(
      key: _listViewKey,
      child: ListView.builder(
        itemCount: regions.length,
        itemBuilder: (BuildContext context, int index) {
          final key = RectGetter.createGlobalKey();

          _keys[index] = key;

          final region = regions[index];

          return RectGetter(
            key: key,
            child: SizedBox(
              child: Align(
                alignment: AlignmentDirectional.center,
                child: ListTile(
                  title: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 4,
                        bottom: 4,
                      ),
                      child: Text(
                        region.code,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );

    return NotificationListener<ScrollUpdateNotification>(
      onNotification: (notification) {
        final visibleRegions = getVisible();

        if (visibleRegions.isNotEmpty && visibleRegions.length <= 1) {
          widget.onShownRegion(visibleRegions[0]);
        } else if (visibleRegions.length >= 2) {
          widget.onShownRegion(visibleRegions[1]);
        }

        return true;
      },
      child: listView,
    );
  }

  List<RegionCode> getVisible() {
    final rect = RectGetter.getRectFromKey(_listViewKey);
    final items = <RegionCode>[];

    if (rect == null) {
      return items;
    }

    _keys.forEach((index, key) {
        final itemRect = RectGetter.getRectFromKey(key);

        if (
          itemRect != null
          && !(itemRect.top > rect.bottom || itemRect.bottom < rect.top)
        ) {
          items.add(widget.regions[index]);
        }
      }
    );

    return items;
  }

}
