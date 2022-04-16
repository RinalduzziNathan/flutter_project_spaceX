// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roadster.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Roadster _$RoadsterFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Roadster',
      json,
      ($checkedConvert) {
        final val = Roadster(
          name: $checkedConvert('name', (v) => v as String?),
          flickr_images: $checkedConvert('flickr_images',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
          earth_distance_km: $checkedConvert(
              'earth_distance_km', (v) => (v as num?)?.toDouble()),
          details: $checkedConvert('details', (v) => v as String?),
          launch_mass_kg:
              $checkedConvert('launch_mass_kg', (v) => (v as num?)?.toDouble()),
        );
        return val;
      },
    );

Map<String, dynamic> _$RoadsterToJson(Roadster instance) => <String, dynamic>{
      'launch_mass_kg': instance.launch_mass_kg,
      'earth_distance_km': instance.earth_distance_km,
      'name': instance.name,
      'flickr_images': instance.flickr_images,
      'details': instance.details,
    };
