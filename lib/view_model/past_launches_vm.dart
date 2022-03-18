
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/manager/launch_manager.dart';
import 'package:flutter_project/model/launch.dart';

class PastLaunches extends ChangeNotifier{

  List<Launch>? launches = [];
  bool isLoading = true;
  PastLaunches(){
    loadPastLaunches();
  }
  Future<void> loadPastLaunches() async {

    launches = await LaunchManager().loadPastLaunches();
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