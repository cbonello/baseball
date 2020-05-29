import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'inning_home_away.g.dart';

@JsonSerializable(createFactory: true, createToJson: false, explicitToJson: true)
class LSInningHomeAwayModel extends Equatable {
  const LSInningHomeAwayModel(this.runs, this.hits, this.errors, this.leftOnBase);

  factory LSInningHomeAwayModel.fromJson(Map<String, dynamic> json) =>
      _$LSInningHomeAwayModelFromJson(json);

  @JsonKey()
  final int runs;

  @JsonKey()
  final int hits;

  @JsonKey()
  final int errors;

  @JsonKey()
  final int leftOnBase;

  @override
  List<Object> get props => <Object>[runs, hits, errors, leftOnBase];
}
