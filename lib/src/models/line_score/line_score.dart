import 'package:baseball/src/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'line_score.g.dart';

@JsonSerializable(createFactory: true, createToJson: false, explicitToJson: true)
class LineScoreModel extends Equatable {
  const LineScoreModel(
    this.copyright,
    this.currentInning,
    this.currentInningOrdinal,
    this.inningState,
    this.inningHalf,
    this.isTopInning,
    this.scheduledInnings,
    this.innings,
    this.teams,
    this.defense,
    this.offense,
    this.balls,
    this.strikes,
    this.outs,
  );

  factory LineScoreModel.fromJson(Map<String, dynamic> json) =>
      _$LineScoreModelFromJson(json);

  @JsonKey(required: true)
  final String copyright;

  @JsonKey()
  final int currentInning;

  @JsonKey()
  final String currentInningOrdinal;

  @JsonKey()
  final String inningState;

  @JsonKey()
  final String inningHalf;

  @JsonKey()
  final bool isTopInning;

  @JsonKey()
  final int scheduledInnings;

  @JsonKey(required: true)
  final List<LSInningModel> innings;

  @JsonKey(required: true)
  final LSTeamsModel teams;

  @JsonKey(required: true)
  final LSDefenseModel defense;

  @JsonKey(required: true)
  final LSOffenseModel offense;

  @JsonKey()
  final int balls;

  @JsonKey()
  final int strikes;

  @JsonKey()
  final int outs;

  int get homeTeamTotalRuns => teams.home?.runs ?? 0;
  int get awayTeamTotalRuns => teams.away?.runs ?? 0;
  int get homeTeamTotalHits => teams.home?.hits ?? 0;
  int get awayTeamTotalHits => teams.away?.hits ?? 0;
  int get homeTeamTotalErrors => teams.home?.errors ?? 0;
  int get awayTeamTotalErrors => teams.away?.errors ?? 0;

  @override
  List<Object> get props => <Object>[
        copyright,
        currentInning,
        currentInningOrdinal,
        inningState,
        inningHalf,
        isTopInning,
        scheduledInnings,
        innings,
        teams,
        defense,
        offense,
        balls,
        strikes,
        outs,
      ];

  @override
  bool get stringify => true;
}
