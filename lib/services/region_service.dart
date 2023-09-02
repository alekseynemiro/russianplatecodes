import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/region.dart';

class RegionService {

  Future<List<Region>> fetchRegions() async {
    final data = await rootBundle.loadString('assets/regions.json');
    final parsed = jsonDecode(data) as List;
    final List<Region> result = [];

    for (var json in parsed) {
      for (var code in (json['codes'] as List)) {
        result.add(Region(
          code: code,
          name: json['region'],
        ));
      }
    }

    result.sort((a, b) => int.parse(a.code).compareTo(int.parse(b.code)));

    return result;
  }

}
