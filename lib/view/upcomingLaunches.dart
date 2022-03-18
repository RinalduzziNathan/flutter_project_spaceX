import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_project/manager/launch_manager.dart';
import 'package:flutter_project/model/launch.dart';
import 'package:flutter_project/view_model/upcoming_launches.dart';
import 'package:flutter_project/view/launchList.dart';
import 'package:provider/provider.dart';

class ViewUpcomingLaunches extends StatelessWidget {
  const ViewUpcomingLaunches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UpcomingLaunches(),
      child: Consumer<UpcomingLaunches>(
        builder: (context, UpcomingLaunches upcomingLaunches, child) =>
            Scaffold(
                body: upcomingLaunches.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: [
                                Text("Time before next launch : "),
                                CountdownTimer(
                                  endTime: upcomingLaunches.endTime,
                                ),
                              ],
                            ),
                            color: Colors.grey,
                            height: 60,
                          ),
                          Expanded(
                              child: LaunchList(
                            launches: upcomingLaunches.launches!,
                            onFavoriteChanged:
                                (Launch launch, bool shouldToggle) async {
                              if (shouldToggle) {
                                upcomingLaunches.toggleFavorites(launch);
                              }
                            },
                          ))
                        ],
                      )),
      ),
    );
  }
}
