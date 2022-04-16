// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launch _$LaunchFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Launch',
      json,
      ($checkedConvert) {
        final val = Launch(
          links: $checkedConvert(
              'links',
              (v) =>
                  v == null ? null : Links.fromJson(v as Map<String, dynamic>)),
          staticFireDateUtc: $checkedConvert('staticFireDateUtc',
              (v) => v == null ? null : DateTime.parse(v as String)),
          name: $checkedConvert('name', (v) => v as String?),
          dateUtc: $checkedConvert(
              'dateUtc', (v) => v == null ? null : DateTime.parse(v as String)),
          details: $checkedConvert('details', (v) => v as String?),
          launchLibraryId:
              $checkedConvert('launchLibraryId', (v) => v as String?),
          id: $checkedConvert('id', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$LaunchToJson(Launch instance) => <String, dynamic>{
      'links': instance.links?.toJson(),
      'staticFireDateUtc': instance.staticFireDateUtc?.toIso8601String(),
      'details': instance.details,
      'name': instance.name,
      'dateUtc': instance.dateUtc?.toIso8601String(),
      'launchLibraryId': instance.launchLibraryId,
      'id': instance.id,
    };
