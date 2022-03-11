import 'package:flutter/material.dart';
import 'package:flutter_project/model/launch.dart';

import 'image_placeholder.dart';


class LaunchList extends StatelessWidget {
  final List<Launch> launches;
  final Function(Launch, bool)? onFavoriteChanged;

  const LaunchList({Key? key, required this.launches, this.onFavoriteChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return launches.isNotEmpty ? ListView.builder(
      
      itemBuilder: (context, position) {
        Launch launch = launches[position];
        return InkWell(
          onTap: () async {
           // bool oldFavorite = SpotManager().isSpotFavorite(spot.id);

            //var newFavorite = await Navigator.of(context).pushNamed(SpotDetail.route,
              //  arguments: SpotDetailArguments(spot: spot));

           // if (newFavorite is bool && newFavorite != oldFavorite) {
             // onFavoriteChanged?.call(spot, false);
            //}
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
                    Text("Catégorie : ${launch.dateUtc ?? 'Inconnue'}")
                  ],
                ),
              ),

              const SizedBox(width: 16,)
            ],
          ),
        );
      },
      itemCount: launches.length,
    ) : const Center(child: Text('Aucun spot'),);
  }
}
