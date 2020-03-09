import 'dart:convert';
import 'dart:io';

import 'package:baseball/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Parses LineScoreModel', () async {
    final File file = File('test/support/line_score.json');
    final dynamic json = jsonDecode(await file.readAsString());
    final LineScoreModel lineScore = LineScoreModel.fromJson(json);
    expect(json['innings'], isNotNull);

    final List<dynamic> jsonInnings = json['innings'];
    final List<LSInningModel> innings =
        jsonInnings?.map<LSInningModel>((dynamic jsonInning) {
      final Map<String, dynamic> inning = jsonInning;
      return inning == null ? null : LSInningModel.fromJson(inning);
    })?.toList();
    final LSTeamsModel teams = LSTeamsModel.fromJson(json['teams']);
    final LSDefenseModel defense = LSDefenseModel.fromJson(json['defense']);
    final LSOffenseModel offense = LSOffenseModel.fromJson(json['offense']);

    expect(lineScore.currentInningOrdinal, '9th');
    expect(lineScore.inningState, 'Top');
    expect(lineScore.inningHalf, 'Top');
    expect(lineScore.isTopInning, true);
    expect(lineScore.innings.length, innings.length);
    for (int i = 0; i < lineScore.innings.length; i++) {
      expect(lineScore.innings[i], innings[i]);
    }
    expect(lineScore.teams, teams);
    expect(lineScore.defense, defense);
    expect(lineScore.offense, offense);
    expect(lineScore.balls, 0);
    expect(lineScore.strikes, 0);
    expect(lineScore.outs, 3);
    expect(lineScore.homeTeamTotalRuns, 10);
    expect(lineScore.homeTeamTotalHits, 8);
    expect(lineScore.awayTeamTotalRuns, 4);
    expect(lineScore.awayTeamTotalHits, 7);
  });
}
