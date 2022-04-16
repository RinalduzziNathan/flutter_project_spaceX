import 'package:flutter/material.dart';
import 'package:flutter_project/manager/api_manager.dart';
import 'package:flutter_project/manager/launch_manager.dart';
import 'package:flutter_project/model/launch.dart';
import 'dart:convert';
import 'image_placeholder.dart';

class LaunchDetailArguments {
  Launch launch;

  LaunchDetailArguments({required this.launch});
}

class LaunchDetail extends StatefulWidget {
  static const route = "/launch";

  final Launch launch;

  const LaunchDetail(this.launch, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LaunchDetailState();
}

class _LaunchDetailState extends State<LaunchDetail> {
  bool? isFavorite;
  late Launch launch;

  @override
  void initState() {
    launch = widget.launch;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, isFavorite);
        return true;
      },
      child: Scaffold(
                appBar: AppBar(
                  title: Text(launch.name ?? ''),
                  actions: isFavorite != null
                      ? [
                    IconButton(
                        onPressed: () async {
                        //  bool currentlyFavorite = isFavorite ?? false;
                         // await SpotManager().toggleFavorite(spot);
                          setState(() {
                            //isFavorite = !currentlyFavorite;
                          });
                        },
                        icon: Icon(isFavorite ?? false
                            ? Icons.favorite
                            : Icons.favorite_border))
                  ]
                      : null,
                ),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 300,
                            child: PageView.builder(
                              itemBuilder: (context, position) {
                                return Image.network(
                                (launch.links?.patch?.small ?? ''),
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, child, stack) {
                                    return const ImagePlaceholder();
                                  },
                                );
                              },
                              itemCount: 1
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _SpotDescription(launch.details ?? "Details are missing"),
                      ),
                      Center(
                        child: Container(
                          child: const Text(
                            "Launch date :",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("the : ${launch.date_utc.toString()}"),
                      ),
                    ],
                  ),
                ))
    );
  }
}

class _SpotDescription extends StatelessWidget {
  final String description;

  const _SpotDescription(this.description);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            "Description",
            style: TextStyle(fontSize: 18),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(description)
      ],
    );
  }
}
