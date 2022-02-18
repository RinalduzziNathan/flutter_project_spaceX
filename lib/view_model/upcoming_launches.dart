
import 'package:flutter/cupertino.dart';
import 'package:flutter_project/manager/launch_manager.dart';
import 'package:flutter_project/model/launch.dart';

class UpcomingLaunches extends ChangeNotifier{

  List<Launch> launches = [];

  NextLaunchViewModel(){
    loadNextLaunch();
  }
  Future<void> loadNextLaunch() async {
    launches = (await LaunchManager().loadUpcomingLaunches())!;
    for (var launch in launches){
      print(launch.name);
    }
    notifyListeners();
  }

}