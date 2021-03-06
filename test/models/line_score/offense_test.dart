import 'dart:convert';

import 'package:baseball/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Parses LSOffenseModel', () async {
    const contents = '''
{
  "batter": {
    "id": 592696,
    "fullName": "Eddie Rosario",
    "link": "/api/v1/people/592696"
  },
  "onDeck": {
    "id": 593934,
    "fullName": "Miguel Sano",
    "link": "/api/v1/people/593934"
  },
  "inHole": {
    "id": 596146,
    "fullName": "Max Kepler",
    "link": "/api/v1/people/596146"
  },
  "first": {
    "id": 593871,
    "fullName": "Jorge Polanco",
    "link": "/api/v1/people/593871"
  },
  "pitcher": {
    "id": 660813,
    "fullName": "Brusdar Graterol",
    "link": "/api/v1/people/660813"
  },
  "team": {
    "id": 142,
    "name": "Minnesota Twins",
    "link": "/api/v1/teams/142"
  }
}
''';
    final dynamic json = jsonDecode(contents);
    final offense = LSOffenseModel.fromJson(json);
    final batter = LSEntityPlayerModel.fromJson(json['batter']);
    final onDeck = LSEntityPlayerModel.fromJson(json['onDeck']);
    final inHole = LSEntityPlayerModel.fromJson(json['inHole']);
    final first = LSEntityPlayerModel.fromJson(json['first']);
    final pitcher = LSEntityPlayerModel.fromJson(json['pitcher']);
    final team = LSEntityTeamModel.fromJson(json['team']);

    expect(offense, isNotNull);
    expect(offense.batter, batter);
    expect(offense.onDeck, onDeck);
    expect(offense.inHole, inHole);
    expect(offense.first, first);
    expect(offense.pitcher, pitcher);
    expect(offense.team, team);
  });
}
