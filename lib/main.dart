import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_project/manager/launch_manager.dart';
import 'package:flutter_project/model/launch.dart';
import 'package:flutter_project/view/launchList.dart';
import 'package:flutter_project/view_model/next_launch_vm.dart';
import 'package:flutter_project/view_model/upcoming_launches.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';
import 'manager/database_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseManager().init();
  runApp(const App());
}


