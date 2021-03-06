// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Company',
      json,
      ($checkedConvert) {
        final val = Company(
          name: $checkedConvert('name', (v) => v as String?),
          founder: $checkedConvert('founder', (v) => v as String?),
          employees: $checkedConvert('employees', (v) => v as int?),
          launch_sites: $checkedConvert('launch_sites', (v) => v as int?),
          summary: $checkedConvert('summary', (v) => v as String?),
          headquarters: $checkedConvert(
              'headquarters',
              (v) => v == null
                  ? null
                  : Headquarters.fromJson(v as Map<String, dynamic>)),
          founded: $checkedConvert('founded', (v) => v as int?),
        );
        return val;
      },
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'founded': instance.founded,
      'launch_sites': instance.launch_sites,
      'name': instance.name,
      'founder': instance.founder,
      'employees': instance.employees,
      'summary': instance.summary,
      'headquarters': instance.headquarters?.toJson(),
    };
