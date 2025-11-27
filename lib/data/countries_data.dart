import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/country.dart';

class CountriesData {
  static Future<List<Country>> loadCountries() async {
    final String response = await rootBundle.loadString('assets/data/pays_info.txt');
    final List<dynamic> data = json.decode(response);

    return data.map((json) => Country.fromJson(json)).toList();
  }
}
