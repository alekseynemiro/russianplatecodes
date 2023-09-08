import 'dart:async';

import 'package:flutter/material.dart';

import '../../models/region_code.dart';
import '../../services/region_service.dart';
import '../views/linear_gradient_wrap.dart';
import '../views/application_bar.dart';
import '../views/application_drawer.dart';
import '../views/region_code_list.dart';
import '../views/region_info.dart';
import '../views/three_row_layout.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  final _regionService = RegionService();

  late final Stream<int> _stream;

  late List<RegionCode> _regionList;

  RegionCode? _activeRegion;

  @override
  void initState() {
    super.initState();

    _stream = (() {
      late final StreamController<int> controller;
      controller = StreamController<int>(
        onListen: () async {
          _regionList = await _regionService.fetchRegionsSortedByCode();

          controller.add(1);

          await controller.close();

          setState(() {
            _activeRegion = _regionList[0];
          });
        },
      );
      return controller.stream;
    })();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ApplicationBar('Автомобильные коды'),
      drawer: const ApplicationDrawer(),
      body: ThreeRowLayout(
        main: LinearGradientWrap(
          StreamBuilder<int>(
            stream: _stream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasData) {
                return RegionCodeList(
                  regions: _regionList,
                  onShownRegion: (region) {
                    setState(() {
                      _activeRegion = region;
                    });
                  },
                );
              }

              return const Center(
                child: Text("Нет данных..."),
              );
            },
          ),
        ),
        footer: SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          child: RegionInfo(_activeRegion),
        ),
      ),
    );
  }

}
