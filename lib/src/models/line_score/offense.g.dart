// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LSOffenseModel _$LSOffenseModelFromJson(Map<String, dynamic> json) {
  return LSOffenseModel(
    json['batter'] == null
        ? null
        : LSEntityPlayerModel.fromJson(json['batter'] as Map<String, dynamic>),
    json['onDeck'] == null
        ? null
        : LSEntityPlayerModel.fromJson(json['onDeck'] as Map<String, dynamic>),
    json['inHole'] == null
        ? null
        : LSEntityPlayerModel.fromJson(json['inHole'] as Map<String, dynamic>),
    json['first'] == null
        ? null
        : LSEntityPlayerModel.fromJson(json['first'] as Map<String, dynamic>),
    json['pitcher'] == null
        ? null
        : LSEntityPlayerModel.fromJson(json['pitcher'] as Map<String, dynamic>),
    json['team'] == null
        ? null
        : LSEntityTeamModel.fromJson(json['team'] as Map<String, dynamic>),
  );
}
