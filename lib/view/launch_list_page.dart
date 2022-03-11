import 'package:flutter/material.dart';
import 'package:flutter_project/manager/launch_manager.dart';
import 'package:flutter_project/model/launch.dart';
import 'package:flutter_project/view/launchList.dart';


class LaunchListPage extends StatefulWidget {
  final bool isFromFavorite;

  const LaunchListPage({Key? key, this.isFromFavorite = false}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LaunchListPage();
}

class _LaunchListPage extends State<LaunchListPage> {
  @override
  Widget build(BuildContext context) {
    return LaunchList(
      launches : widget.isFromFavorite
          ? LaunchManager().favoriteLaunch
          : LaunchManager().launch,
      onFavoriteChanged: (Launch launch, bool shouldToggle) async {
        if (shouldToggle) {
          await LaunchManager().toggleFavorite(launch);
        }
        setState(() {});
      },
    );
  }
}
