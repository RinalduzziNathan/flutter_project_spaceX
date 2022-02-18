

import 'package:flutter_project/manager/api_manager.dart';
import 'package:flutter_project/model/launch.dart';

class LaunchManager {

  List<Launch>? _launches;

  List<Launch> get launch => _launches ?? [];

  List<Launch>? _favoriteLaunch;

  Launch? nextLaunch;

  List<Launch> get favoriteLaunch => _favoriteLaunch ?? [];

  static final LaunchManager _instance = LaunchManager._internal();

  factory LaunchManager() => _instance;

  LaunchManager._internal();

  Future<List<Launch>?> loadUpcomingLaunches() async {
    // Calling API
    try {
      var response = await ApiManager().getUpcomingLaunches();
      if (response.data != null) {
        var upcomingLaunches = List<Map<String, dynamic>>.from(response.data?["data"]).map((json) => Launch.fromJson(json)).toList();

        return upcomingLaunches;

      }
    } catch (e) {
      print("Erreur : $e");
      return _launches;
    }
  }

  Future<Launch?> loadNextLaunch() async {
    // Calling API
    try {
      var response = await ApiManager().getNextLaunch();
      if (response.data != null) {
        nextLaunch = Launch.fromJson(response.data ?? {});
        print(nextLaunch?.name);
        print(nextLaunch?.details);
        print(nextLaunch?.links?.patch?.small);
        return nextLaunch;

      }
    } catch (e) {
      print("Erreur : $e");
    }
  }


}