// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'headquarters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Headquarters _$HeadquartersFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'Headquarters',
      json,
      ($checkedConvert) {
        final val = Headquarters(
          adress: $checkedConvert('adress', (v) => v as String?),
          city: $checkedConvert('city', (v) => v as String?),
          state: $checkedConvert('state', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$HeadquartersToJson(Headquarters instance) =>
    <String, dynamic>{
      'adress': instance.adress,
      'city': instance.city,
      'state': instance.state,
    };
