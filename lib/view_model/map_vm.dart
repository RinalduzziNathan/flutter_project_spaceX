
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/manager/landpads_manager.dart';
import 'package:flutter_project/manager/launch_manager.dart';
import 'package:flutter_project/model/launch.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapLandpad extends ChangeNotifier{
  Set<Marker> markers = {};
  late CameraPosition initialLocation;

  late var mapinitialLocation;

  MapLandpad(){
    mapinitialLocation = const CameraPosition(
        zoom: 0,
        bearing: 0,
        target: LatLng(45.521563, -122.677433)
    );
    loadLandpad();
  }
  loadLandpad() async {
    markers.clear();

    var landpads = await LandpadsManager().loadLandpads();
     CameraPosition(
        zoom: 10,
        target: LatLng(landpads.first.longitude!,landpads.first.longitude!));
    for (var landpad in landpads) {
      LatLng pinPosition = LatLng(landpad.latitude!,landpad.longitude!);

      markers.add(Marker(markerId: MarkerId(landpad.id!),position: pinPosition,icon:BitmapDescriptor.defaultMarker ));


    }



    notifyListeners();
  }

}