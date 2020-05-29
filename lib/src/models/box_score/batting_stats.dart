import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'batting_stats.g.dart';

@JsonSerializable(createFactory: true, createToJson: false, explicitToJson: true)
class BSBattingStatsModel extends Equatable {
  const BSBattingStatsModel(
    this.runs,
    this.doubles,
    this.triples,
    this.homeRuns,
    this.strikeOuts,
    this.hits,
    this.atBats,
    this.rbi,
  );

  factory BSBattingStatsModel.fromJson(Map<String, dynamic> json) =>
      _$BSBattingStatsModelFromJson(json);

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
      ];
}
