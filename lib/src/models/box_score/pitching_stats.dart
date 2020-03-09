import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pitching_stats.g.dart';

@JsonSerializable(createFactory: true, createToJson: false, explicitToJson: true)
class BSPitchingStatsModel extends Equatable {
  const BSPitchingStatsModel(
    this.runs,
    this.doubles,
    this.triples,
    this.homeRuns,
    this.strikeOuts,
    this.hits,
    this.atBats,
    this.rbi,
    this.inningsPitched,
    this.wins,
    this.losses,
  );

  factory BSPitchingStatsModel.fromJson(Map<String, dynamic> json) =>
      _$BSPitchingStatsModelFromJson(json);

  @JsonKey()
  final int runs;

  @JsonKey()
  final int doubles;

  @JsonKey()
  final int triples;

  @JsonKey()
  final int homeRuns;

  @JsonKey()
  final int strikeOuts;

  @JsonKey()
  final int hits;

  @JsonKey()
  final int atBats;

  @JsonKey()
  final int rbi;

  @JsonKey()
  final String inningsPitched;

  @JsonKey()
  final int wins;

  @JsonKey()
  final int losses;

  @override
  List<Object> get props => <Object>[
        runs,
        doubles,
        triples,
        homeRuns,
        strikeOuts,
        hits,
        atBats,
        rbi,
        inningsPitched,
        wins,
        losses,
      ];

  @override
  bool get stringify => true;
}
