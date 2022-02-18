import 'package:flutter/material.dart';
import 'package:flutter_project/manager/launch_manager.dart';
import 'package:flutter_project/model/launch.dart';
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
    return Column(
      children: [
        ChangeNotifierProvider(
            create: (BuildContext context) => NextLaunchViewModel(),
            child: Consumer<NextLaunchViewModel>(
                builder: (context, NextLaunchViewModel viewModel, child) {
              return Scaffold(
                appBar: AppBar(
                  title: Text("Next Launch : "),
                ),
                body: Center(
                  child: Text(viewModel.launch?.name ?? "Not found"),
                ),
              );
            })),
        ChangeNotifierProvider(
            create: (BuildContext context) => UpcomingLaunches(),
            child: Consumer<UpcomingLaunches>(
                builder: (context, UpcomingLaunches viewModel, child) {
                 return Text
                      (viewModel.launches.first.name ?? "Not found");
                })),
      ],
    );
  }
}
