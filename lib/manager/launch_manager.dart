

import 'package:flutter_project/manager/api_manager.dart';
import 'package:flutter_project/model/launch.dart';

class LaunchManager {

  List<Launch>? _launch;

  List<Launch> get launch => _launch ?? [];

  List<Launch>? _favoriteLaunch;

  Launch? nextLaunch;

  List<Launch> get favoriteLaunch => _favoriteLaunch ?? [];

  static final LaunchManager _instance = LaunchManager._internal();

  factory LaunchManager() => _instance;

  LaunchManager._internal();


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