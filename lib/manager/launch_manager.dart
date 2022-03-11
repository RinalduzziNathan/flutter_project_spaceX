import 'package:flutter/cupertino.dart';
import 'package:flutter_project/manager/api_manager.dart';
import 'package:flutter_project/model/launch.dart';

class LaunchManager {
  List<Launch> upcominglaunches = [];

  List<Launch>? _launches;

  List<Launch> get launch => _launches ?? [];

  List<Launch>? _favoriteLaunch;

  Launch? nextLaunch;

  List<Launch> get favoriteLaunch => _favoriteLaunch ?? [];

  static final LaunchManager _instance = LaunchManager._internal();

  factory LaunchManager() => _instance;

  LaunchManager._internal();

  Future<List<Launch>> loadUpcomingLaunches() async {
    try {
      var response = await ApiManager().getUpcomingLaunches();

      upcominglaunches.addAll(List<Launch>.from(
          response.data?.map((item) => Launch.fromJson(item)) ?? []));
      return upcominglaunches;
    } catch (error, stackTrace) {
      debugPrint("$stackTrace");
    }
    return upcominglaunches;
  }

  Future<Launch?> loadNextLaunch() async {
    // Calling API
    try {
      var response = await ApiManager().getNextLaunch();
      if (response.data != null) {
        nextLaunch = Launch.fromJson(response.data ?? {});

        return nextLaunch;
      }
    } catch (e) {
      print("Erreur : $e");
    }
  }
}
