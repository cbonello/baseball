// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LSTeamsModel _$LSTeamsModelFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['home', 'away']);
  return LSTeamsModel(
    json['home'] == null
        ? null
        : LSInningHomeAwayModel.fromJson(json['home'] as Map<String, dynamic>),
    json['away'] == null
        ? null
        : LSInningHomeAwayModel.fromJson(json['away'] as Map<String, dynamic>),
  );
}
