import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/region.dart';

class RegionService {

  Future<List<Region>> fetchRegions() async {
    final data = await rootBundle.loadString('assets/regions.json');
    final parsed = jsonDecode(data) as List;
    final List<Region> result = [];

    for (final json in parsed) {
      final codes = List<String>.from(json['codes']);

      for (final code in codes) {
        result.add(Region(
          code: code,
          name: json['region'],
          allCodes: codes,
        ));
      }
    }

    result.sort((a, b) => int.parse(a.code).compareTo(int.parse(b.code)));

    return result;
  }

}
