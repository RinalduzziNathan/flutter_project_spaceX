
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'landpad.g.dart';

@JsonSerializable()
class LatLng {
  LatLng({
    required this.lat,
    required this.lng,
  });

  factory LatLng.fromJson(Map<String, dynamic> json) => _$LatLngFromJson(json);
  Map<String, dynamic> toJson() => _$LatLngToJson(this);

  final double lat;
  final double lng;
}


@JsonSerializable()
class Landpad {
  Landpad({
    required this.coords,
    required this.id,
    required this.name,
    required this.locality
  });

  factory Landpad.fromJson(Map<String, dynamic> json) => _$LandpadFromJson(json);
  Map<String, dynamic> toJson() => _$LandpadToJson(this);

  final LatLng coords;
  final String id;
  final String name;
  final String locality;
}
