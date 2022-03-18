import 'package:flutter/cupertino.dart';
import 'package:flutter_project/manager/api_manager.dart';
import 'package:flutter_project/model/launch.dart';
import 'package:flutter_project/src/landpad.dart';

import 'database_manager.dart';

class LandpadsManager {
  List<Landpad> landpads = [];
  static final LandpadsManager _instance = LandpadsManager._internal();

  LandpadsManager._internal();
  factory LandpadsManager() => _instance;

  Future<List<Landpad>> loadLandpads() async {
    try {
      landpads.clear();
      var response = await ApiManager().getLandpads();

      landpads.addAll(List<Landpad>.from(
          response.data?.map((item) => Landpad.fromJson(item)) ?? []));
      return landpads;
    } catch (error, stackTrace) {
      debugPrint("$stackTrace");
    }
    return landpads;
  }
}
