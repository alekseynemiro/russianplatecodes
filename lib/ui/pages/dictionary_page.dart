import 'package:flutter/material.dart';

import '../../models/region_name.dart';
import '../../services/region_service.dart';
import '../views/app_drawer.dart';
import '../views/no_data.dart';
import '../views/region_list.dart';
import '../views/region_search.dart';
import '../views/three_row_layout.dart';

class DictionaryPage extends StatefulWidget {

  const DictionaryPage({ super.key });

  @override
  State<DictionaryPage> createState() => _DictionaryPageState();

}

class _DictionaryPageState extends State<DictionaryPage> {

  final _regionService = RegionService();

  late final Future<List<RegionName>> _regionListFuture;

  late List<RegionName> _regionList;

  String? _filter;

  @override
  void initState() {
    super.initState();

    _regionListFuture = _regionService.fetchRegionsSortedByName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Справочник регионов'),
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future: _regionListFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData) {
            if (_filter != null && _filter!.isNotEmpty) {
              _regionList = snapshot.data!
                .where((x) => x.name.contains(_filter!) || x.codes.where((xx) => xx.contains(_filter!)).isNotEmpty)
                .toList();
            } else {
              _regionList = snapshot.data!;
            }

            Widget content;

            if (_regionList.isEmpty) {
              content = Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const NoData(),
                        _filter != null && _filter!.isNotEmpty
                          ? OutlinedButton(
                            child: const Text('Сбросить фильтр'),
                            onPressed: () {
                              setState(() {
                                _filter = null;
                              });
                            }
                          )
                          : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ],
              ) ;
            } else {
              content = RegionList(
                regions: _regionList,
              );
            }

            return ThreeRowLayout(
              header: RegionSearch(
                filter: _filter,
                onChanged: _filterRegions,
              ),
              main: content,
            );
          }

          return const NoData();
        },
      ),
    );
  }

  void _filterRegions(String value) {
    setState(() {
      _filter = value;
    });
  }

}
