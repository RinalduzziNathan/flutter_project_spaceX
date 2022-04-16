
import 'package:flutter/cupertino.dart';
import 'package:flutter_project/manager/roadster_manager.dart';

import '../model/roadster.dart';

class RoadsterViewModel extends ChangeNotifier{

  Roadster? roadster;
  bool isLoading = true;
  RoadsterViewModel(){
    loadRoadster();
  }
  Future<void> loadRoadster() async {
    roadster = (await RoadsterManager().loadRoadster())!;
    isLoading = false;
    notifyListeners();
  }

}