// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LSEntityPlayerModel _$LSEntityPlayerModelFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['id', 'fullName', 'link']);
  return LSEntityPlayerModel(
    json['id'] as int,
    json['fullName'] as String,
    json['link'] as String,
  );
}
