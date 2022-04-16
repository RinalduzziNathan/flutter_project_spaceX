import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/view_model/roadster_vm.dart';
import 'package:provider/provider.dart';

import 'image_placeholder.dart';

class RoadsterDetail extends StatelessWidget {
  static const route = "/roadster";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => RoadsterViewModel(),
        child: Consumer<RoadsterViewModel>(
          builder: (context, RoadsterViewModel viewModel, child) => Scaffold(
            body: viewModel.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.red,
                      title: Text("The Roadster"),
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 300,
                            width: 300,
                            child: PageView.builder(
                              itemBuilder: (context, position) {
                                return Image.network(
                                  viewModel.roadster!.flickr_images[position],
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, child, stack) {
                                    return const ImagePlaceholder();
                                  },
                                );
                              },
                              itemCount: viewModel.roadster?.flickr_images.length ?? 0,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                  child: Text(
                                    "Details : ",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                const Divider(
                                  thickness: 3,
                                  color: Colors.red,
                                  indent: 0,
                                  endIndent: 0,
                                ),
                                Text(
                                  "${viewModel.roadster?.details}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                  child: Text(
                                    "Some specs  : ",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                const Divider(
                                  thickness: 3,
                                  color: Colors.red,
                                  indent: 0,
                                  endIndent: 0,
                                ),
                                Text(
                                  "Mass of the vehicle : ${viewModel.roadster?.launch_mass_kg}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),Text(
                                  "Distance from  earth (km) : ${viewModel.roadster?.earth_distance_km}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
          ),
        ));
  }
}
