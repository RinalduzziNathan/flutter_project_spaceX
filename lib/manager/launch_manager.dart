import 'package:flutter/cupertino.dart';
import 'package:flutter_project/manager/api_manager.dart';
import 'package:flutter_project/model/launch.dart';

import 'database_manager.dart';

class LaunchManager {
  List<Launch> upcominglaunches = [];

  List<Launch>? _launches;
  List<Launch>? _favoriteLaunches;

  List<Launch> get launch => _launches ?? [];

  Launch? nextLaunch;

  static final LaunchManager _instance = LaunchManager._internal();

  factory LaunchManager() => _instance;

  LaunchManager._internal();

  Future<void> initFavoriteLaunches() async {
    _favoriteLaunches = await DatabaseManager().getFavoriteLaunches();
  }

  Future<List<Launch>> loadUpcomingLaunches() async {
    try {
      upcominglaunches.clear();
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
  Future<Launch?> getLaunchDetail(String idLaunch) async {
    Launch? launch;
    try {
      var response = await ApiManager().getLaunchByID(idLaunch);
      if (response.data != null) {
        launch = Launch.fromJson(response.data ?? {});
      }
    } catch (error) {
      debugPrint("Erreur : $error}");
    }
    return launch;
  }

  Future<void> loadFavoriteLaunches() async {
    _favoriteLaunches = await DatabaseManager().getFavoriteLaunches();
  }

  List<Launch> getFavoritesLaunches(){
    return _favoriteLaunches ?? [];
  }

  bool isLaunchFavorite(String idLaunch) {
    try {
      return _favoriteLaunches?.firstWhere((launch) => launch.id == idLaunch) != null;
    } catch (e) {
      return false;
    }
  }

  Future<void> toggleFavorite(Launch launchToUpdate) async {
    bool isFavorite = await DatabaseManager().isFavorite(launchToUpdate.id!);
    await DatabaseManager().toggleFavorite(isFavorite, launchToUpdate);
    if (isFavorite) {
      _favoriteLaunches?.removeWhere((Launch launch) => launch.id == launchToUpdate.id);
    } else {
      _favoriteLaunches ??= [];
      _favoriteLaunches?.add(launchToUpdate);
    }
  }
}
