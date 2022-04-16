import 'package:flutter/cupertino.dart';
import 'package:flutter_project/manager/api_manager.dart';


import '../model/company.dart';
import '../model/roadster.dart';

class RoadsterManager {
  Roadster? roadster;
  static final RoadsterManager _instance = RoadsterManager._internal();

  RoadsterManager._internal();
  factory RoadsterManager() => _instance;

  Future<Roadster?> loadRoadster() async {
    try {
      var response = await ApiManager().getRoadster();
      if (response.data != null) {
         roadster = Roadster.fromJson(response.data ?? {});

        return roadster;
      }
    } catch (e) {
      print("Erreur : $e");
    }
  }
}
