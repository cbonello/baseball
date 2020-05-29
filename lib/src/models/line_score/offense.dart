import 'package:baseball/src/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'offense.g.dart';

@JsonSerializable(createFactory: true, createToJson: false, explicitToJson: true)
class LSOffenseModel extends Equatable {
  const LSOffenseModel(
    this.batter,
    this.onDeck,
    this.inHole,
    this.first,
    this.pitcher,
    this.team,
  );

  factory LSOffenseModel.fromJson(Map<String, dynamic> json) =>
      _$LSOffenseModelFromJson(json);

  @JsonKey()
  final LSEntityPlayerModel batter;

  @JsonKey()
  final LSEntityPlayerModel onDeck;

  @JsonKey()
  final LSEntityPlayerModel inHole;

  @JsonKey()
  final LSEntityPlayerModel first;

  @JsonKey()
  final LSEntityPlayerModel pitcher;

  @JsonKey()
  final LSEntityTeamModel team;

  @override
  List<Object> get props => <Object>[batter, onDeck, inHole, first, pitcher, team];
}
