import 'package:baseball/src/models/helper.dart';
import 'package:baseball/src/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class BoxScoreModel extends Equatable {
  const BoxScoreModel({
    @required this.awayPitchers,
    @required this.homePitchers,
    @required this.awayBatters,
    @required this.homeBatters,
  });

  factory BoxScoreModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> teamsAway = walkMap(json, <String>['teams', 'away']);
    final Map<String, dynamic> playersAway = walkMap(teamsAway, <String>['players']);
    final Map<String, dynamic> teamsHome = walkMap(json, <String>['teams', 'home']);
    final Map<String, dynamic> playerHome = walkMap(teamsHome, <String>['players']);

    final awayPitchers = <BSPlayerModel>[];
    final List<int> awayPitchersID =
        teamsAway == null ? null : teamsAway['pitchers']?.cast<int>();
    for (final id in awayPitchersID ?? <int>[]) {
      awayPitchers.add(BSPlayerModel.fromJson(playersAway['ID$id']));
    }

    final homePitchers = <BSPlayerModel>[];
    final List<int> homePitchersID =
        teamsHome == null ? null : teamsHome['pitchers']?.cast<int>();
    for (final id in homePitchersID ?? <int>[]) {
      homePitchers.add(BSPlayerModel.fromJson(playerHome['ID$id']));
    }

    final awayBatters = <BSPlayerModel>[];
    final List<int> awayBattersID =
        teamsAway == null ? null : teamsAway['batters']?.cast<int>();
    for (final id in awayBattersID ?? <int>[]) {
      awayBatters.add(BSPlayerModel.fromJson(playersAway['ID$id']));
    }

    final homeBatters = <BSPlayerModel>[];
    final List<int> homeBattersID =
        teamsHome == null ? null : teamsHome['batters']?.cast<int>();
    for (final id in homeBattersID ?? <int>[]) {
      homeBatters.add(BSPlayerModel.fromJson(playerHome['ID$id']));
    }

    return BoxScoreModel(
      awayPitchers: awayPitchers,
      homePitchers: homePitchers,
      awayBatters: awayBatters,
      homeBatters: homeBatters,
    );
  }

  final List<BSPlayerModel> awayPitchers;
  final List<BSPlayerModel> homePitchers;
  final List<BSPlayerModel> awayBatters;
  final List<BSPlayerModel> homeBatters;

  @override
  List<Object> get props => <Object>[
        awayPitchers,
        homePitchers,
        awayBatters,
        homeBatters,
      ];

  @override
  bool get stringify => true;
}
