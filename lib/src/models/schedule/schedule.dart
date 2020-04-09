import 'package:baseball/src/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schedule.g.dart';

@JsonSerializable(createFactory: true, createToJson: false, explicitToJson: true)
class SCScheduleModel extends Equatable {
  const SCScheduleModel(this.games);

  factory SCScheduleModel.fromJson(Map<String, dynamic> json) {
    final schedule = _$SCScheduleModelFromJson(json);

    // API may returns games with no away team when a game was cancelled.
    // Example: March 12th, 2020.
    return SCScheduleModel(
      schedule.games
          .where((SCGameModel game) => game.awayTeamId != null && game.homeTeamId != null)
          .toList(),
    );
  }

  @JsonKey(required: true)
  final List<SCGameModel> games;

  @override
  List<Object> get props => <Object>[games];

  @override
  bool get stringify => true;
}
