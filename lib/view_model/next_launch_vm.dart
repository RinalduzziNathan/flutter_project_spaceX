
import 'package:flutter/cupertino.dart';
import 'package:flutter_project/manager/launch_manager.dart';
import 'package:flutter_project/model/launch.dart';

class NextLaunchViewModel extends ChangeNotifier{

  Launch? launch;

  NextLaunchViewModel(){
   loadNextLaunch();
  }
    Future<void> loadNextLaunch() async {
     launch = (await LaunchManager().loadNextLaunch())!;
     notifyListeners();
   }

}