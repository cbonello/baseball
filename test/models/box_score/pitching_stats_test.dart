import 'dart:convert';

import 'package:baseball/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Parses BSPitchingStatsModel', () async {
    const String contents = '''
{
  "runs": 1,
  "doubles": 2,
  "triples": 3,
  "homeRuns": 4,
  "strikeOuts": 5,
  "hits": 6,
  "atBats": 7,
  "inningsPitched": "0.5",
  "wins": 8,
  "losses": 9,
  "rbi": 10
}
''';
    final dynamic json = jsonDecode(contents);
    final BSPitchingStatsModel stats = BSPitchingStatsModel.fromJson(json);

    expect(stats, isNotNull);
    expect(stats.runs, 1);
    expect(stats.doubles, 2);
    expect(stats.triples, 3);
    expect(stats.homeRuns, 4);
    expect(stats.strikeOuts, 5);
    expect(stats.hits, 6);
    expect(stats.atBats, 7);
    expect(stats.inningsPitched, '0.5');
    expect(stats.wins, 8);
    expect(stats.losses, 9);
    expect(stats.rbi, 10);
  });

  test('Parses BSPitchingStatsModel (no data)', () async {
    const String contents = '{}';
    final dynamic json = jsonDecode(contents);
    final BSPitchingStatsModel stats = BSPitchingStatsModel.fromJson(json);

    expect(stats, isNotNull);
    expect(stats.runs, isNull);
    expect(stats.doubles, isNull);
    expect(stats.triples, isNull);
    expect(stats.homeRuns, isNull);
    expect(stats.strikeOuts, isNull);
    expect(stats.hits, isNull);
    expect(stats.atBats, isNull);
    expect(stats.inningsPitched, isNull);
    expect(stats.wins, isNull);
    expect(stats.losses, isNull);
    expect(stats.rbi, isNull);
  });
}
