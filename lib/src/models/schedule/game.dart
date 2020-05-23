import 'package:baseball/src/models/helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class SCGameModel extends Equatable {
  const SCGameModel({
    @required this.gamePk,
    @required this.gameDate,
    @required this.gameStatus,
    @required this.homeTeamScore,
    @required this.homeTeamId,
    @required this.homeTeamNameShort,
    @required this.awayTeamScore,
    @required this.awayTeamId,
    @required this.awayTeamNameShort,
  });

  factory SCGameModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> teamsHome = walkMap(json, <String>['teams', 'home']);
    final Map<String, dynamic> teamsHomeTeam = walkMap(teamsHome, <String>['team']);
    final Map<String, dynamic> teamsAway = walkMap(json, <String>['teams', 'away']);
    final Map<String, dynamic> teamsAwayTeam = walkMap(teamsAway, <String>['team']);

    return SCGameModel(
      gamePk: json['gamePk'],
      gameDate: json['gameDate'],
      gameStatus: json['status'] == null ? null : json['status']['detailedState'],
      homeTeamScore: teamsHome == null ? null : teamsHome['score'],
      homeTeamId:
          teamsHomeTeam['name'] == null ? null : _teamNametoId[teamsHomeTeam['name']],
      homeTeamNameShort:
          teamsHomeTeam['name'] == null ? null : _teamNametoAbbr[teamsHomeTeam['name']],
      awayTeamScore: teamsAway == null ? null : teamsAway['score'],
      awayTeamId:
          teamsAwayTeam['name'] == null ? null : _teamNametoId[teamsAwayTeam['name']],
      awayTeamNameShort:
          teamsAwayTeam['name'] == null ? null : _teamNametoAbbr[teamsAwayTeam['name']],
    );
  }

  final int gamePk;
  final String gameDate;
  final String gameStatus;
  final int homeTeamScore;
  final int homeTeamId;
  final String homeTeamNameShort;
  final int awayTeamScore;
  final int awayTeamId;
  final String awayTeamNameShort;

  String get homeTeamAsset => 'assets/teams/${homeTeamNameShort.toLowerCase()}.png';
  String get awayTeamAsset => 'assets/teams/${awayTeamNameShort.toLowerCase()}.png';

  @override
  List<Object> get props => <Object>[
        gamePk,
        gameDate,
        gameStatus,
        homeTeamScore,
        homeTeamId,
        homeTeamNameShort,
        awayTeamScore,
        awayTeamId,
        awayTeamNameShort,
      ];

  @override
  bool get stringify => true;

  static final Map<String, String> _teamNametoAbbr = <String, String>{
    'Arizona Diamondbacks': 'ARI',
    'Atlanta Braves': 'ATL',
    'Baltimore Orioles': 'BAL',
    'Boston Red Sox': 'BOS',
    'Chicago Cubs': 'CHC',
    'Cincinnati Reds': 'CIN',
    'Cleveland Indians': 'CLE',
    'Colorado Rockies': 'COL',
    'Chicago White Sox': 'CWS',
    'Detroit Tigers': 'DET',
    'Houston Astros': 'HOU',
    'Kansas City Royals': 'KC',
    'Los Angeles Angels': 'LAA',
    'Los Angeles Dodgers': 'LAD',
    'Miami Marlins': 'MIA',
    'Milwaukee Brewers': 'MIL',
    'Minnesota Twins': 'MIN',
    'New York Mets': 'NYM',
    'New York Yankees': 'NYY',
    'Oakland Athletics': 'OAK',
    'Philadelphia Phillies': 'PHI',
    'Pittsburgh Pirates': 'PIT',
    'San Diego Padres': 'SD',
    'Seattle Mariners': 'SEA',
    'San Francisco Giants': 'SF',
    'St. Louis Cardinals': 'STL',
    'Tampa Bay Rays': 'TB',
    'Texas Rangers': 'TEX',
    'Toronto Blue Jays': 'TOR',
    'Washington Nationals': 'WSH',
  };

  static final Map<String, int> _teamNametoId = <String, int>{
    'Arizona Diamondbacks': 109,
    'Atlanta Braves': 144,
    'Baltimore Orioles': 110,
    'Boston Red Sox': 111,
    'Chicago Cubs': 112,
    'Cincinnati Reds': 113,
    'Cleveland Indians': 114,
    'Colorado Rockies': 115,
    'Chicago White Sox': 145,
    'Detroit Tigers': 116,
    'Houston Astros': 117,
    'Kansas City Royals': 118,
    'Los Angeles Angels': 108,
    'Los Angeles Dodgers': 119,
    'Miami Marlins': 146,
    'Milwaukee Brewers': 158,
    'Minnesota Twins': 142,
    'New York Mets': 121,
    'New York Yankees': 147,
    'Oakland Athletics': 133,
    'Philadelphia Phillies': 143,
    'Pittsburgh Pirates': 134,
    'San Diego Padres': 135,
    'Seattle Mariners': 136,
    'San Francisco Giants': 137,
    'St. Louis Cardinals': 138,
    'Tampa Bay Rays': 139,
    'Texas Rangers': 140,
    'Toronto Blue Jays': 141,
    'Washington Nationals': 120,
  };
}
