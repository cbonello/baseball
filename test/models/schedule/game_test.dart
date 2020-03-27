import 'dart:convert';

import 'package:baseball/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Parses SCGameModel', () async {
    const contents = '''
{
  "gamePk": 599337,
  "gameDate": "2019-10-04T18:05:00Z",
  "status": {
    "detailedState": "Final"
  },
  "teams": {
    "away": {
      "leagueRecord": {
        "wins": 0,
        "losses": 1
      },
      "score": 2,
      "team": {
        "name": "Tampa Bay Rays"
      },
      "isWinner": false
    },
    "home": {
      "leagueRecord": {
        "wins": 1,
        "losses": 0
      },
      "score": 6,
      "team": {
        "name": "Houston Astros"
      },
      "isWinner": true
    }
  },
  "venue": {
    "name": "Minute Maid Park"
  }
}
''';
    final dynamic json = jsonDecode(contents);
    final game = SCGameModel.fromJson(json);

    expect(game, isNotNull);
    expect(game.gamePk, 599337);
    expect(game.gameDate, '2019-10-04T18:05:00Z');
    expect(game.gameStatus, 'Final');
    expect(game.homeTeamScore, 6);
    expect(game.homeTeamId, 117);
    expect(game.homeTeamNameShort, 'HOU');
    expect(game.awayTeamScore, 2);
    expect(game.awayTeamId, 139);
    expect(game.awayTeamNameShort, 'TB');
  });
}
