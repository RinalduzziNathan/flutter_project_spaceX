import 'package:flutter/material.dart';
import 'package:flutter_project/manager/launch_manager.dart';
import 'package:flutter_project/model/launch.dart';
import 'package:flutter_project/view/launchList.dart';
import 'package:flutter_project/view_model/next_launch_vm.dart';
import 'package:flutter_project/view_model/upcoming_launches.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(title: 'Next Launch :'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UpcomingLaunches(),
      child: Consumer<UpcomingLaunches>(
        builder: (context, UpcomingLaunches upcomingLaunches, child) => Scaffold(
          appBar: AppBar(
            title: const Text("SpaceX"),
          ),
          body: upcomingLaunches.isLoading
              ? const Center(
            child: CircularProgressIndicator(),
          )

                  : LaunchList(launches: upcomingLaunches.launches!)

        ),
      ),
    );
  }
}
