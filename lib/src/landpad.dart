
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'landpad.g.dart';


@JsonSerializable(
  checked: true,explicitToJson: true,
)
class Landpad {
  Landpad({
     this.latitude,
     this.longitude,
     this.id,
     this.name,
     this.locality
  });
  double? latitude;
  double? longitude;
  String? id;
  String? name;
  String? locality;
  factory Landpad.fromJson(Map<String, dynamic> json) => _$LandpadFromJson(json);
  Map<String, dynamic> toJson() => _$LandpadToJson(this);


}
