import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/src/landpad.dart';
import 'package:flutter_project/view_model/map_vm.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

import 'package:provider/provider.dart';

class MapFlutter extends StatefulWidget {
  const MapFlutter({Key? key}) : super(key: key);

  @override
  _MapFlutterState createState() => _MapFlutterState();
}

class _MapFlutterState extends State<MapFlutter> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
        create: (_) => MapLandpad(),
        child: Consumer<MapLandpad>(
            builder: (context, MapLandpad viewmodel, child) => Scaffold(
                  body: GoogleMap(
                    myLocationEnabled: true,
                    markers: viewmodel.markers,
                    initialCameraPosition: viewmodel.mapinitialLocation,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                )));
  }
}
