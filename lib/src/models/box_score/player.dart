import 'package:baseball/src/models/helper.dart';
import 'package:baseball/src/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class BSPlayerModel extends Equatable {
  const BSPlayerModel({
    @required this.fullName,
    @required this.jerseyNumber,
    @required this.position,
    @required this.battingStats,
    @required this.pitchingStats,
  });

  factory BSPlayerModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> batting = walkMap(json, <String>['stats', 'batting']);
    final Map<String, dynamic> pitching = walkMap(json, <String>['stats', 'pitching']);

    return BSPlayerModel(
      fullName: json['person'] == null ? null : json['person']['fullName'],
      jerseyNumber: json['jerseyNumber'],
      position:
          json['position'] == null ? null : BSPositionModel.fromJson(json['position']),
      battingStats: batting == null ? null : BSBattingStatsModel.fromJson(batting),
      pitchingStats: pitching == null ? null : BSPitchingStatsModel.fromJson(pitching),
    );
  }

  final String fullName;
  final String jerseyNumber;
  final BSPositionModel position;
  final BSBattingStatsModel battingStats;
  final BSPitchingStatsModel pitchingStats;

  @override
  List<Object> get props => <Object>[
        fullName,
        jerseyNumber,
        position,
        battingStats,
        pitchingStats,
      ];

  @override
  bool get stringify => true;
}
