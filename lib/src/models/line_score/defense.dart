import 'package:baseball/src/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'defense.g.dart';

@JsonSerializable(createFactory: true, createToJson: false, explicitToJson: true)
class LSDefenseModel extends Equatable {
  const LSDefenseModel(
    this.pitcher,
    this.catcher,
    this.first,
    this.second,
    this.third,
    this.shortstop,
    this.left,
    this.center,
    this.right,
    this.batter,
    this.onDeck,
    this.inHole,
    this.team,
  );

  factory LSDefenseModel.fromJson(Map<String, dynamic> json) =>
      _$LSDefenseModelFromJson(json);

  @JsonKey()
  final LSEntityPlayerModel pitcher;

  @JsonKey()
  final LSEntityPlayerModel catcher;

  @JsonKey()
  final LSEntityPlayerModel first;

  @JsonKey()
  final LSEntityPlayerModel second;

  @JsonKey()
  final LSEntityPlayerModel third;

  @JsonKey()
  final LSEntityPlayerModel shortstop;

  @JsonKey()
  final LSEntityPlayerModel left;

  @JsonKey()
  final LSEntityPlayerModel center;

  @JsonKey()
  final LSEntityPlayerModel right;

  @JsonKey()
  final LSEntityPlayerModel batter;

  @JsonKey()
  final LSEntityPlayerModel onDeck;

  @JsonKey()
  final LSEntityPlayerModel inHole;

  @JsonKey()
  final LSEntityTeamModel team;

  @override
  List<Object> get props => <Object>[
        pitcher,
        catcher,
        first,
        second,
        third,
        shortstop,
        left,
        center,
        right,
        batter,
        onDeck,
        inHole,
        team,
      ];
}
