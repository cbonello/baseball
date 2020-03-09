// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SCScheduleModel _$SCScheduleModelFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['games']);
  return SCScheduleModel(
    (json['games'] as List)
        ?.map((e) =>
            e == null ? null : SCGameModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}
