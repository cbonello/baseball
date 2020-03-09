// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inning.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LSInningModel _$LSInningModelFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['num', 'ordinalNum', 'home', 'away']);
  return LSInningModel(
    json['num'] as int,
    json['ordinalNum'] as String,
    json['home'] == null
        ? null
        : LSInningHomeAwayModel.fromJson(json['home'] as Map<String, dynamic>),
    json['away'] == null
        ? null
        : LSInningHomeAwayModel.fromJson(json['away'] as Map<String, dynamic>),
  );
}
