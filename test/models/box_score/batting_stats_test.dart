import 'dart:convert';

import 'package:baseball/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Parses BSBattingStatsModel', () async {
    const contents = '''
{
  "runs": 1,
  "doubles": 2,
  "triples": 3,
  "homeRuns": 4,
  "strikeOuts": 5,
  "hits": 6,
  "atBats": 7,
  "rbi": 8
}
''';
    final dynamic json = jsonDecode(contents);
    final stats = BSBattingStatsModel.fromJson(json);

    expect(stats, isNotNull);
    expect(stats.runs, 1);
    expect(stats.doubles, 2);
    expect(stats.triples, 3);
    expect(stats.homeRuns, 4);
    expect(stats.strikeOuts, 5);
    expect(stats.hits, 6);
    expect(stats.atBats, 7);
    expect(stats.rbi, 8);
  });

  test('Parses BSBattingStatsModel (no data)', () async {
    const contents = '{}';
    final dynamic json = jsonDecode(contents);
    final stats = BSBattingStatsModel.fromJson(json);

    expect(stats, isNotNull);
    expect(stats.runs, isNull);
    expect(stats.doubles, isNull);
    expect(stats.triples, isNull);
    expect(stats.homeRuns, isNull);
    expect(stats.strikeOuts, isNull);
    expect(stats.hits, isNull);
    expect(stats.atBats, isNull);
    expect(stats.rbi, isNull);
  });
}
