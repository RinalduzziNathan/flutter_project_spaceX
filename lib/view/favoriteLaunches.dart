import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_project/manager/launch_manager.dart';
import 'package:flutter_project/model/launch.dart';
import 'package:flutter_project/view/favoriteLaunchList.dart';
import 'package:flutter_project/view_model/favorites_launches_vm.dart';
import 'package:flutter_project/view_model/upcoming_launches.dart';

import 'package:provider/provider.dart';

class ViewFavoriteLaunches extends StatelessWidget {
  const ViewFavoriteLaunches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FavoritesLaunchesViewModel(),
      child: Consumer<FavoritesLaunchesViewModel>(
        builder: (context, FavoritesLaunchesViewModel favoritesLaunchesViewModel, child) =>
            Scaffold(
                body: favoritesLaunchesViewModel.isLoading
                    ? const Center(
                  child: CircularProgressIndicator(),
                )
                    : Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: [
                          Text("All your favorites Launches :"),

                        ],
                      ),
                      color: Colors.deepPurple,
                      height: 20,
                    ),
                    Expanded(
                        child: FavoriteLaunchList(
                          onFavoriteChanged:
                              (Launch launch, bool shouldToggle) async {
                            if (shouldToggle) {
                              favoritesLaunchesViewModel.toggleFavorites(launch);
                            }
                          },
                        ))
                  ],
                )),
      ),
    );
  }
}
