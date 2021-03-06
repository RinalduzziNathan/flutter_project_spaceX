
import 'package:json_annotation/json_annotation.dart';

import 'links.dart';
part 'launch.g.dart';


@JsonSerializable(
  checked: true,explicitToJson: true,
)
class Launch {
  Launch({
    this.links,
    this.staticFireDateUtc,
    this.name,
    this.date_utc,
    this.details,
    this.launchLibraryId,
    this.id,
  });


  Links? links;
  DateTime? staticFireDateUtc;
  String? details;
  String? name;
  DateTime? date_utc;
  String? launchLibraryId;
  String? id;


  factory Launch.fromJson(Map<String, dynamic> json) => _$LaunchFromJson(json);

  Map<String, dynamic> toJson() => _$LaunchToJson(this);


}


