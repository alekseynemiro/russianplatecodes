import 'package:flutter/material.dart';

import '../../models/region_code.dart';
import 'region_code_view.dart';

class RegionInfo extends StatelessWidget {

  final RegionCode? _region;

  const RegionInfo(this._region, { super.key });

  @override
  Widget build(BuildContext context) {
    final region = this._region;

    if (region != null) {
      final regionNameRow = Row(
        children: <Widget>[
          Flexible(
            child: Text(
              region.name,
              softWrap: true,
              maxLines: 2,
              style: TextStyle(
                fontSize: 42,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      );

      final codeTitle = Row(
        children: [Text(
        region.allCodes.length == 1 ? "Код:" : "Коды:",
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      )]);

      final codeList = Row(
        children: [
          Expanded(
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: region.allCodes.map<RegionCodeView>((code) {
                return RegionCodeView(code);
              }).toList(),
            ),
          ),
        ],
      );

      return Container(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              regionNameRow,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    codeTitle,
                    codeList,
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }

}
