import 'dart:convert';

import 'package:baseball/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Parses BSPlayerModel', () async {
    const contents = '''
{
  "person": {
    "fullName": "Jake Cave"
  },
  "jerseyNumber": "60",
  "position": {
    "name": "Outfielder",
    "type": "Outfielder",
    "abbreviation": "CF"
  },
  "stats": {
    "batting": {},
    "pitching": {},
    "fielding": {}
  },
  "status": {},
  "parentTeamId": 142,
  "seasonStats": {
    "batting": {
      "runs": 0,
      "doubles": 0,
      "triples": 0,
      "homeRuns": 0,
      "strikeOuts": 0,
      "hits": 0,
      "atBats": 0,
      "rbi": 0
    },
    "pitching": {
      "runs": 0,
      "doubles": 0,
      "triples": 0,
      "homeRuns": 0,
      "strikeOuts": 0,
      "hits": 0,
      "atBats": 0,
      "inningsPitched": "0.0",
      "wins": 0,
      "losses": 0,
      "rbi": 0
    },
    "fielding": {
      "assists": 0,
      "putOuts": 0,
      "errors": 0,
      "fielding": ".000"
    }
  },
  "gameStatus": {}
}''';
    final dynamic json = jsonDecode(contents);
    final player = BSPlayerModel.fromJson(json);
    expect(player, isNotNull);
    expect(json['position'], isNotNull);
    expect(json['stats'], isNotNull);

    final position = BSPositionModel.fromJson(json['position']);
    final battingStats = BSBattingStatsModel.fromJson(json['stats']['batting']);
    final pitchingStats = BSPitchingStatsModel.fromJson(json['stats']['pitching']);

    expect(player.fullName, 'Jake Cave');
    expect(player.jerseyNumber, '60');
    expect(player.position, position);
    expect(player.battingStats, battingStats);
    expect(player.pitchingStats, pitchingStats);
  });
}
