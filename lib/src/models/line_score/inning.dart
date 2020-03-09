import 'package:baseball/src/models/line_score/inning_home_away.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'inning.g.dart';

@JsonSerializable(createFactory: true, createToJson: false, explicitToJson: true)
class LSInningModel extends Equatable {
  const LSInningModel(this.num, this.ordinalNum, this.home, this.away);

  factory LSInningModel.fromJson(Map<String, dynamic> json) =>
      _$LSInningModelFromJson(json);

  @JsonKey(required: true)
  final int num;

  @JsonKey(required: true)
  final String ordinalNum;

  @JsonKey(required: true)
  final LSInningHomeAwayModel home;

  @JsonKey(required: true)
  final LSInningHomeAwayModel away;

  @override
  List<Object> get props => <Object>[num, ordinalNum, home, away];

  @override
  bool get stringify => true;
}
