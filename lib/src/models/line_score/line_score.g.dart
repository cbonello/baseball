// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line_score.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LineScoreModel _$LineScoreModelFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const [
    'copyright',
    'innings',
    'teams',
    'defense',
    'offense'
  ]);
  return LineScoreModel(
    json['copyright'] as String,
    json['currentInning'] as int,
    json['currentInningOrdinal'] as String,
    json['inningState'] as String,
    json['inningHalf'] as String,
    json['isTopInning'] as bool,
    json['scheduledInnings'] as int,
    (json['innings'] as List)
        ?.map((e) => e == null
            ? null
            : LSInningModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['teams'] == null
        ? null
        : LSTeamsModel.fromJson(json['teams'] as Map<String, dynamic>),
    json['defense'] == null
        ? null
        : LSDefenseModel.fromJson(json['defense'] as Map<String, dynamic>),
    json['offense'] == null
        ? null
        : LSOffenseModel.fromJson(json['offense'] as Map<String, dynamic>),
    json['balls'] as int,
    json['strikes'] as int,
    json['outs'] as int,
  );
}
