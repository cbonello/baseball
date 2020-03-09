import 'dart:convert';
import 'dart:io';

import 'package:baseball/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Parses BoxScoreModel', () async {
    final File file = File('test/support/box_score.json');
    final dynamic json = jsonDecode(await file.readAsString());
    final BoxScoreModel boxScore = BoxScoreModel.fromJson(json);

    expect(boxScore, isNotNull);
    expect(boxScore.awayBatters.length, 16);
    expect(boxScore.homePitchers.length, 7);
    expect(boxScore.awayBatters.length, 16);
    expect(boxScore.homeBatters.length, 17);
  });
}
