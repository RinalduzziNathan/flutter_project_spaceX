
import 'package:flutter/cupertino.dart';
import 'package:flutter_project/manager/launch_manager.dart';
import 'package:flutter_project/model/launch.dart';

import 'package:flutter_project/manager/api_manager.dart';
class UpcomingLaunches extends ChangeNotifier{
  int endTime = 0;
  List<Launch>? launches = [];
  bool isLoading = true;
  UpcomingLaunches(){
    loadNextLaunches();
  }
  Future<void> loadNextLaunches() async {

    launches = await LaunchManager().loadUpcomingLaunches();
    await LaunchManager().initFavoriteLaunches();


    endTime = launches?.first?.dateUtc?.millisecondsSinceEpoch ?? DateTime.now().millisecondsSinceEpoch;
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