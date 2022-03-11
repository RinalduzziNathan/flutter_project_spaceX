
import 'package:flutter/cupertino.dart';
import 'package:flutter_project/manager/launch_manager.dart';
import 'package:flutter_project/model/launch.dart';

import 'package:flutter_project/manager/api_manager.dart';
class UpcomingLaunches extends ChangeNotifier{

  List<Launch> launches = [];
  bool isLoading = true;
  UpcomingLaunches(){
    loadNextLaunches();
  }
  Future<void> loadNextLaunches() async {
    try {
      var response = await ApiManager().getUpcomingLaunches();
      launches.addAll(List<Launch>.from(
          response.data?.map((item) => Launch.fromJson(item)) ?? []));
    } catch (error, stackTrace) {
      debugPrint("$stackTrace");
    }

     isLoading = false;
    notifyListeners();
  }

}