import 'dart:convert';

import 'package:baseball/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Parses LSOffenseModel', () async {
    const contents = '''
{
  "home": {
    "runs": 10,
    "hits": 8,
    "errors": 1,
    "leftOnBase": 7
  },
  "away": {
    "runs": 4,
    "hits": 7,
    "errors": 1,
    "leftOnBase": 9
  }
}
''';
    final dynamic json = jsonDecode(contents);
    final teams = LSTeamsModel.fromJson(json);
    final home = LSInningHomeAwayModel.fromJson(json['home']);
    final away = LSInningHomeAwayModel.fromJson(json['away']);

    expect(teams, isNotNull);
    expect(teams.home, home);
    expect(teams.away, away);
  });
}
