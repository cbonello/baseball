import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'entity_player.g.dart';

@JsonSerializable(createFactory: true, createToJson: false, explicitToJson: true)
class LSEntityPlayerModel extends Equatable {
  const LSEntityPlayerModel(this.id, this.fullName, this.link);

  factory LSEntityPlayerModel.fromJson(Map<String, dynamic> json) =>
      _$LSEntityPlayerModelFromJson(json);

  @JsonKey(required: true)
  final int id;

  @JsonKey(required: true)
  final String fullName;

  @JsonKey(required: true)
  final String link;

  @override
  List<Object> get props => <Object>[id, fullName, link];
}
