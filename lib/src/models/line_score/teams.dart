import 'package:baseball/src/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'teams.g.dart';

@JsonSerializable(createFactory: true, createToJson: false, explicitToJson: true)
class LSTeamsModel extends Equatable {
  const LSTeamsModel(this.home, this.away);

  factory LSTeamsModel.fromJson(Map<String, dynamic> json) =>
      _$LSTeamsModelFromJson(json);

  @JsonKey(required: true)
  final LSInningHomeAwayModel home;

  @JsonKey(required: true)
  final LSInningHomeAwayModel away;

  @override
  List<Object> get props => <Object>[home, away];

  @override
  bool get stringify => true;
}
