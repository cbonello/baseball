import 'package:baseball/src/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schedule.g.dart';

@JsonSerializable(createFactory: true, createToJson: false, explicitToJson: true)
class SCScheduleModel extends Equatable {
  const SCScheduleModel(this.games);

  factory SCScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$SCScheduleModelFromJson(json);

  @JsonKey(required: true)
  final List<SCGameModel> games;

  @override
  List<Object> get props => <Object>[games];

  @override
  bool get stringify => true;
}
