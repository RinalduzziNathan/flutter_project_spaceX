import 'package:flutter/cupertino.dart';
import 'package:flutter_project/manager/api_manager.dart';
import 'package:flutter_project/model/launch.dart';
import 'package:flutter_project/src/landpad.dart';

import '../model/company.dart';
import 'database_manager.dart';

class CompanyManager {
  Company? company;
  static final CompanyManager _instance = CompanyManager._internal();

  CompanyManager._internal();
  factory CompanyManager() => _instance;

  Future<Company?> loadCompanies() async {
    try {
      var response = await ApiManager().getCompany();
      if (response.data != null) {
         company = Company.fromJson(response.data ?? {});

        return company;
      }
    } catch (e) {
      print("Erreur : $e");
    }
  }
}
