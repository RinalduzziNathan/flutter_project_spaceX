
import 'package:flutter_project/model/headquarters.dart';
import 'package:json_annotation/json_annotation.dart';

import 'links.dart';
part 'company.g.dart';

@JsonSerializable(
  checked: true,explicitToJson: true,
)
class Company {
  Company({
    this.name,
    this.founder,
    this.employees,
    this.launch_sites,
    this.summary,
    this.headquarters
  });



  String? name;
  String? founder;
  int? employees;
  int? launch_sites;
  String? summary;
  Headquarters? headquarters;



  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);


}