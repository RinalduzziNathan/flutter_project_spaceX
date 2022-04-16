import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_project/manager/launch_manager.dart';
import 'package:flutter_project/model/launch.dart';
import 'package:flutter_project/view/pastLaunchList.dart';
import 'package:flutter_project/view/placeholderView.dart';
import 'package:flutter_project/view_model/past_launches_vm.dart';
import 'package:flutter_project/view_model/upcoming_launches_vm.dart';
import 'package:flutter_project/view/upcomingLaunchList.dart';
import 'package:provider/provider.dart';

class InfoSpaceX extends StatelessWidget {
  const InfoSpaceX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      ],
    );
  }



}