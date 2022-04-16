import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_project/manager/launch_manager.dart';
import 'package:flutter_project/model/launch.dart';
import 'package:flutter_project/view/pastLaunchList.dart';
import 'package:flutter_project/view_model/past_launches_vm.dart';
import 'package:flutter_project/view_model/upcoming_launches_vm.dart';
import 'package:flutter_project/view/upcomingLaunchList.dart';
import 'package:provider/provider.dart';

class ViewPastLaunches extends StatelessWidget {
  const ViewPastLaunches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PastLaunchesViewModel(),
      child: Consumer<PastLaunchesViewModel>(
        builder: (context, PastLaunchesViewModel viewModel, child) =>
            Scaffold(
                body: viewModel.isLoading
                    ? const Center(
                  child: CircularProgressIndicator(),
                )
                    : Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: [
                          Text("The past launches"),
                        ],

                      ),
                      color: Colors.blueGrey,
                      height: 40,
                    ),
                    Expanded(
                        child: PastLaunchesList(
                          launches: viewModel.launches!,
                          onFavoriteChanged:
                              (Launch launch, bool shouldToggle) async {
                            if (shouldToggle) {
                              viewModel.toggleFavorites(launch);
                            }
                          },
                        ))
                  ],
                )),
      ),
    );
  }
}
