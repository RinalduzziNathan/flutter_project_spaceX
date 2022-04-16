
import 'package:flutter_project/model/patch.dart';
import 'package:json_annotation/json_annotation.dart';

part 'headquarters.g.dart';
@JsonSerializable(
  checked: true,explicitToJson: true,
)
class Headquarters {
  Headquarters({
    this.address,
    this.city,
    this.state,
  });
  String? address;
  String? city;
  String? state;

  factory Headquarters.fromJson(Map<String, dynamic> json) => _$HeadquartersFromJson(json);

  Map<String, dynamic> toJson() => _$HeadquartersToJson(this);

}