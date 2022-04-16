
import 'package:flutter_project/model/headquarters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'roadster.g.dart';

@JsonSerializable(
  checked: true,explicitToJson: true,
)
class Roadster {
  Roadster({
    this.name,
    required this.flickr_images,
    this.earth_distance_km,
    this.details,
    this.launch_mass_kg,
  });

  double? launch_mass_kg;
  double? earth_distance_km;
  String? name;
  List<String> flickr_images;
  String? details;

  factory Roadster.fromJson(Map<String, dynamic> json) => _$RoadsterFromJson(json);

  Map<String, dynamic> toJson() => _$RoadsterToJson(this);


}