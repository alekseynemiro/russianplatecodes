import 'package:flutter/material.dart';

import '../../models/region_name.dart';
import 'region_code_view.dart';

class RegionList extends StatefulWidget {

  final List<RegionName> regions;

  const RegionList({
    super.key,
    required this.regions,
  });

  @override
  createState() => _RegionListState();

}

class _RegionListState extends State<RegionList> {

  @override
  Widget build(BuildContext context) {
    final List<RegionName> regions = widget.regions;

    final listView = ListView.builder(
      itemCount: regions.length,
      itemBuilder: (BuildContext context, int index) {
        final region = regions[index];

        Widget leading = const SizedBox.shrink();

        if (
          index == 0
          || regions[index - 1].name[0].toUpperCase() != region.name[0].toUpperCase()
        ) {
          leading = CircleAvatar(
            child: Text(
              region.name[0].toUpperCase(),
              style: Theme.of(context).textTheme.headlineLarge,
            )
          );
        }

        final regionName = Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            region.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        );

        final codeList = Wrap(
          spacing: 8,
          runSpacing: 4,
          children: region.codes.map<RegionCodeView>((x) {
            return RegionCodeView(
              code: x,
              brightness: RegionCodeViewBrightness.light,
            );
          }).toList(),
        );

        return ListTile(
          minLeadingWidth: 48,
          titleAlignment: ListTileTitleAlignment.top,
          leading: leading,
          title: regionName,
          subtitle: codeList,
        );
      }
    );

    return listView;
  }

}
