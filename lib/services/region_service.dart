import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/region_code.dart';
import '../models/region_name.dart';

class RegionService {

  Future<List<RegionCode>> fetchRegionsSortedByCode() async {
    final data = await _fetchRegions();
    final List<RegionCode> result = [];

    for (final item in data) {
      final codes = List<String>.from(item.codes);

      for (final code in codes) {
        result.add(RegionCode(
          code: code,
          name: item.region,
          allCodes: codes,
        ));
      }
    }

    result.sort((a, b) => int.parse(a.code).compareTo(int.parse(b.code)));

    return result;
  }

  Future<List<RegionName>> fetchRegionsSortedByName() async {
    final data = await _fetchRegions();
    final List<RegionName> result = [];

    for (final item in data) {
      result.add(RegionName(
        name: item.region,
        codes: item.codes,
      ));
    }

    result.sort((a, b) => a.name.compareTo(b.name));

    return result;
  }

  Future<List<_RegionRawData>> _fetchRegions() async {
    final data = await rootBundle.loadString('assets/regions.json');
    final parsed = jsonDecode(data) as List;
    final List<_RegionRawData> result = [];

    for (final json in parsed) {
      result.add(_RegionRawData(
        codes: List<String>.from(json['codes']),
        region: json['region'],
      ));
    }

    return result;
  }
}

class _RegionRawData {

  final List<String> codes;

  final String region;

  const _RegionRawData({
    required this.codes,
    required this.region,
  });

}
