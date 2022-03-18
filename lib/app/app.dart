import 'package:flutter/material.dart';
import 'package:flutter_project/model/launch.dart';
import 'package:flutter_project/view/favoriteLaunchList.dart';
import 'package:flutter_project/view/home.dart';
import 'package:flutter_project/view/launch_detail.dart';


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Space X launches',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: (RouteSettings settings) {
        var arguments = settings.arguments;
        switch (settings.name) {
          case LaunchDetail.route:
            if (arguments != null && arguments is LaunchDetailArguments) {
              Launch  launch= arguments.launch;
              return MaterialPageRoute(builder: (_) => LaunchDetail(launch));
            } else {
              throw Exception(
                  "Bad route, exception");
            }

          default:
            return unknownRoute();
        }
      },
      home: const HomePage(title: 'SpaceX'),
    );
  }

  MaterialPageRoute unknownRoute() {
    return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text("Route inconnue")),
        ));
  }
}
