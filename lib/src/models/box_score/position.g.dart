// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BSPositionModel _$BSPositionModelFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['name', 'type', 'abbreviation']);
  return BSPositionModel(
    json['name'] as String,
    json['type'] as String,
    json['abbreviation'] as String,
  );
}
