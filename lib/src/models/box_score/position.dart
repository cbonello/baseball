import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'position.g.dart';

@JsonSerializable(createFactory: true, createToJson: false, explicitToJson: true)
class BSPositionModel extends Equatable {
  const BSPositionModel(
    this.name,
    this.type,
    this.abbreviation,
  );

  factory BSPositionModel.fromJson(Map<String, dynamic> json) =>
      _$BSPositionModelFromJson(json);

  @JsonKey(required: true)
  final String name;

  @JsonKey(required: true)
  final String type;

  @JsonKey(required: true)
  final String abbreviation;

  @override
  List<Object> get props => <Object>[name, type, abbreviation];
}
