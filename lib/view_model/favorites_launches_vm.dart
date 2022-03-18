
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/manager/database_manager.dart';
import 'package:flutter_project/manager/launch_manager.dart';
import 'package:flutter_project/model/launch.dart';

//view model that will load the fav launches and manage the toggle favorite
class FavoritesLaunchesViewModel extends ChangeNotifier{
  int endTime = 0;
  List<Launch>? favlaunches = [];
  bool isLoading = true;
  FavoritesLaunchesViewModel(){
    loadFavLaunches();
  }
  Future<void> loadFavLaunches() async {


    favlaunches = await DatabaseManager().getFavoriteLaunches();
    await LaunchManager().initFavoriteLaunches();

    isLoading = false;
    notifyListeners();
  }

  Future<void> toggleFavorites(Launch launch) async{
    await LaunchManager().toggleFavorite(launch);
    notifyListeners();
  }

  bool isLaunchFavorite(String idLaunch){
    bool isFavorite = LaunchManager().isLaunchFavorite(idLaunch);
    return isFavorite;
  }


}