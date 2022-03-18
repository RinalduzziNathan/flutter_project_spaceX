// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landpad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Landpad _$LandpadFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Landpad',
      json,
      ($checkedConvert) {
        final val = Landpad(
          latitude: $checkedConvert('latitude', (v) => (v as num?)?.toDouble()),
          longitude:
              $checkedConvert('longitude', (v) => (v as num?)?.toDouble()),
          id: $checkedConvert('id', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          locality: $checkedConvert('locality', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$LandpadToJson(Landpad instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'id': instance.id,
      'name': instance.name,
      'locality': instance.locality,
    };
