
import 'package:flutter/cupertino.dart';
import 'package:flutter_project/manager/launch_manager.dart';
import 'package:flutter_project/model/launch.dart';

import 'package:flutter_project/manager/api_manager.dart';
class UpcomingLaunches extends ChangeNotifier{

  List<Launch>? launches = [];
  bool isLoading = true;
  UpcomingLaunches(){
    loadNextLaunches();
  }
  Future<void> loadNextLaunches() async {

    launches = (await LaunchManager().loadUpcomingLaunches());

     isLoading = false;
    notifyListeners();
  }

}