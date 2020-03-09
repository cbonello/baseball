// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'defense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LSDefenseModel _$LSDefenseModelFromJson(Map<String, dynamic> json) {
  return LSDefenseModel(
    json['pitcher'] == null
        ? null
        : LSEntityPlayerModel.fromJson(json['pitcher'] as Map<String, dynamic>),
    json['catcher'] == null
        ? null
        : LSEntityPlayerModel.fromJson(json['catcher'] as Map<String, dynamic>),
    json['first'] == null
        ? null
        : LSEntityPlayerModel.fromJson(json['first'] as Map<String, dynamic>),
    json['second'] == null
        ? null
        : LSEntityPlayerModel.fromJson(json['second'] as Map<String, dynamic>),
    json['third'] == null
        ? null
        : LSEntityPlayerModel.fromJson(json['third'] as Map<String, dynamic>),
    json['shortstop'] == null
        ? null
        : LSEntityPlayerModel.fromJson(
            json['shortstop'] as Map<String, dynamic>),
    json['left'] == null
        ? null
        : LSEntityPlayerModel.fromJson(json['left'] as Map<String, dynamic>),
    json['center'] == null
        ? null
        : LSEntityPlayerModel.fromJson(json['center'] as Map<String, dynamic>),
    json['right'] == null
        ? null
        : LSEntityPlayerModel.fromJson(json['right'] as Map<String, dynamic>),
    json['batter'] == null
        ? null
        : LSEntityPlayerModel.fromJson(json['batter'] as Map<String, dynamic>),
    json['onDeck'] == null
        ? null
        : LSEntityPlayerModel.fromJson(json['onDeck'] as Map<String, dynamic>),
    json['inHole'] == null
        ? null
        : LSEntityPlayerModel.fromJson(json['inHole'] as Map<String, dynamic>),
    json['team'] == null
        ? null
        : LSEntityTeamModel.fromJson(json['team'] as Map<String, dynamic>),
  );
}
