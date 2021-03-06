import 'dart:convert';

import 'package:baseball/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Parses LSEntityPlayerModel', () async {
    const contents = '''
{
  "pitcher": {
    "id": 547973,
    "fullName": "Aroldis Chapman",
    "link": "/api/v1/people/547973"
  },
  "catcher": {
    "id": 596142,
    "fullName": "Gary Sanchez",
    "link": "/api/v1/people/596142"
  },
  "first": {
    "id": 518934,
    "fullName": "DJ LeMahieu",
    "link": "/api/v1/people/518934"
  },
  "second": {
    "id": 650402,
    "fullName": "Gleyber Torres",
    "link": "/api/v1/people/650402"
  },
  "third": {
    "id": 570482,
    "fullName": "Gio Urshela",
    "link": "/api/v1/people/570482"
  },
  "shortstop": {
    "id": 544369,
    "fullName": "Didi Gregorius",
    "link": "/api/v1/people/544369"
  },
  "left": {
    "id": 457727,
    "fullName": "Cameron Maybin",
    "link": "/api/v1/people/457727"
  },
  "center": {
    "id": 458731,
    "fullName": "Brett Gardner",
    "link": "/api/v1/people/458731"
  },
  "right": {
    "id": 592450,
    "fullName": "Aaron Judge",
    "link": "/api/v1/people/592450"
  },
  "batter": {
    "id": 650402,
    "fullName": "Gleyber Torres",
    "link": "/api/v1/people/650402"
  },
  "onDeck": {
    "id": 596142,
    "fullName": "Gary Sanchez",
    "link": "/api/v1/people/596142"
  },
  "inHole": {
    "id": 544369,
    "fullName": "Didi Gregorius",
    "link": "/api/v1/people/544369"
  },
  "team": {
    "id": 147,
    "name": "New York Yankees",
    "link": "/api/v1/teams/147"
  }
}
''';
    final dynamic json = jsonDecode(contents);
    final defense = LSDefenseModel.fromJson(json);
    final pitcher = LSEntityPlayerModel.fromJson(json['pitcher']);
    final catcher = LSEntityPlayerModel.fromJson(json['catcher']);
    final first = LSEntityPlayerModel.fromJson(json['first']);
    final second = LSEntityPlayerModel.fromJson(json['second']);
    final third = LSEntityPlayerModel.fromJson(json['third']);
    final shortstop = LSEntityPlayerModel.fromJson(json['shortstop']);
    final left = LSEntityPlayerModel.fromJson(json['left']);
    final center = LSEntityPlayerModel.fromJson(json['center']);
    final right = LSEntityPlayerModel.fromJson(json['right']);
    final batter = LSEntityPlayerModel.fromJson(json['batter']);
    final onDeck = LSEntityPlayerModel.fromJson(json['onDeck']);
    final inHole = LSEntityPlayerModel.fromJson(json['inHole']);
    final team = LSEntityTeamModel.fromJson(json['team']);

    expect(defense, isNotNull);
    expect(defense.pitcher, pitcher);
    expect(defense.catcher, catcher);
    expect(defense.first, first);
    expect(defense.second, second);
    expect(defense.third, third);
    expect(defense.shortstop, shortstop);
    expect(defense.left, left);
    expect(defense.center, center);
    expect(defense.right, right);
    expect(defense.batter, batter);
    expect(defense.onDeck, onDeck);
    expect(defense.inHole, inHole);
    expect(defense.team, team);
  });
}
