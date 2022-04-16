import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/manager/launch_manager.dart';
import 'package:flutter_project/model/launch.dart';

import '../manager/notification_service.dart';

class UpcomingLaunchesViewModel extends ChangeNotifier{
  int endTimer = 0;  int notificationTime = 0;
  List<Launch>? launches = [];
  bool isLoading = true;
  UpcomingLaunchesViewModel(){
    loadNextLaunches();
  }
  Future<void> loadNextLaunches() async {

    launches = await LaunchManager().loadUpcomingLaunches();
    await LaunchManager().initFavoriteLaunches();


    endTimer = launches?.first.date_utc?.millisecondsSinceEpoch ?? DateTime.now().millisecondsSinceEpoch;
    isLoading = false;
    tz.initializeTimeZones();



    var fuseeDate = launches?.first.date_utc;
    var offset =  DateTime(fuseeDate!.year, fuseeDate.month , fuseeDate.day, fuseeDate.hour,fuseeDate.minute - 5,fuseeDate.second);
    //send the notification only if allowed

    var prefs = await SharedPreferences.getInstance();
    var notificationSetting = prefs.getBool('notif');
    if(notificationSetting == null){
      notificationSetting = true;
      await prefs.setBool('notif', true);
    }if(notificationSetting) {
      NotificationService().showNotificationDateTime(
          2, "Just a reminder...",
          "The launch of ${launches?.first.name} will start in 5 minutes",
          offset);
    }
    notifyListeners();
  }
//Prepare for a new launch
  Future<void> toggleFavorites(Launch launch) async{
    await LaunchManager().toggleFavorite(launch);
    notifyListeners();
  }

  bool isLaunchFavorite(String idLaunch){
    bool isFavorite = LaunchManager().isLaunchFavorite(idLaunch);
    return isFavorite;
  }


}