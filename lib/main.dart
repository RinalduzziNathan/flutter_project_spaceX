import 'package:flutter/material.dart';

import 'app/app.dart';
import 'manager/database_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseManager().init();
  runApp(const App());
}


