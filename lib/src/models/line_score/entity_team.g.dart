// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LSEntityTeamModel _$LSEntityTeamModelFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['id', 'name', 'link']);
  return LSEntityTeamModel(
    json['id'] as int,
    json['name'] as String,
    json['link'] as String,
  );
}
