import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'entity_team.g.dart';

@JsonSerializable(createFactory: true, createToJson: false, explicitToJson: true)
class LSEntityTeamModel extends Equatable {
  const LSEntityTeamModel(this.id, this.name, this.link);

  factory LSEntityTeamModel.fromJson(Map<String, dynamic> json) =>
      _$LSEntityTeamModelFromJson(json);

  @JsonKey(required: true)
  final int id;

  @JsonKey(required: true)
  final String name;

  @JsonKey(required: true)
  final String link;

  @override
  List<Object> get props => <Object>[id, name, link];

  @override
  bool get stringify => true;
}
