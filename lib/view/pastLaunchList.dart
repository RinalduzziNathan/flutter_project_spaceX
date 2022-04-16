import 'package:flutter/material.dart';
import 'package:flutter_project/manager/launch_manager.dart';
import 'package:flutter_project/model/launch.dart';
import 'package:flutter_project/view/launch_detail.dart';
import 'package:flutter_project/view_model/past_launches_vm.dart';
import 'package:flutter_project/view_model/upcoming_launches_vm.dart';
import 'package:provider/provider.dart';

import 'image_placeholder.dart';


class PastLaunchesList extends StatelessWidget {
  final List<Launch> launches;
  final Function(Launch, bool)? onFavoriteChanged;

  const PastLaunchesList({Key? key, required this.launches,required this.onFavoriteChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PastLaunchesViewModel>(builder:(context, PastLaunchesViewModel viewModel, child){
      return launches.isNotEmpty ? ListView.builder(

        itemBuilder: (context, position) {
          Launch launch = launches[position];
          return InkWell(
            onTap: () async {
              bool oldFavorite = LaunchManager().isLaunchFavorite(launch.id!);

              var newFavorite = await Navigator.of(context).pushNamed(LaunchDetail.route,
                  arguments: LaunchDetailArguments(launch: launch));

              if (newFavorite is bool && newFavorite != oldFavorite) {
                onFavoriteChanged?.call(launch, false);
              }
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.network(
                      launch.links?.patch?.small ?? '',
                      fit: BoxFit.cover,
                      errorBuilder: (context, child, stack) {
                        return const ImagePlaceholder();
                      },
                    )),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        launch.name ?? '',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text("Catégorie : ${launch.date_utc ?? 'Inconnue'}"),
                      IconButton(
                        icon: Icon((viewModel.isLaunchFavorite(launch.id!))
                            ? Icons.favorite
                            : Icons.favorite_border,color: Colors.red,),
                        onPressed: () {
                          onFavoriteChanged?.call(launch, true);
                        },
                      ),
                      const SizedBox(width: 16,)
                    ],
                  ),
                ),

                const SizedBox(width: 16,)
              ],
            ),
          );
        },
        itemCount: launches.length,
      ) : const Center(child: Text('No launches'),);
    });

  }
}
