import 'package:flutter/cupertino.dart';
import 'package:flutter_project/manager/api_manager.dart';
import 'package:flutter_project/model/launch.dart';
import 'package:flutter_project/src/landpad.dart';

import '../model/company.dart';
import 'database_manager.dart';

class CompanyManager {
  List<Company> companies = [];
  static final CompanyManager _instance = CompanyManager._internal();

  CompanyManager._internal();
  factory CompanyManager() => _instance;

  Future<List<Company>> loadCompanies() async {
    try {
      companies.clear();
      var response = await ApiManager().getCompanies();

      companies.addAll(List<Company>.from(
          response.data?.map((item) => Company.fromJson(item)) ?? []));
      return companies;
    } catch (error, stackTrace) {
      debugPrint("$stackTrace");
    }
    return companies;
  }
}
