
import 'package:flutter_project/model/patch.dart';
import 'package:json_annotation/json_annotation.dart';

part 'links.g.dart';
@JsonSerializable(
  checked: true,explicitToJson: true,
)
class Links {
  Links({
    this.patch,
  });
  Patch? patch;

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);

}