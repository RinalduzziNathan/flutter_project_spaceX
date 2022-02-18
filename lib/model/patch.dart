import 'package:json_annotation/json_annotation.dart';
part 'patch.g.dart';
@JsonSerializable(
  checked: true,explicitToJson: true,
)
class Patch {
  Patch({
    this.small,

  });

  String? small;

  factory Patch.fromJson(Map<String, dynamic> json) => _$PatchFromJson(json);

  Map<String, dynamic> toJson() => _$PatchToJson(this);
}
