import 'dart:convert';
import 'dart:io';

import 'package:baseball/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Parses SCGameModel', () async {
    final File file = File('test/support/schedule.json');
    final dynamic json = jsonDecode(await file.readAsString());
    expect(json['dates'], isNotNull);
    expect(json['dates'], isNotEmpty);

    final SCScheduleModel schedule = SCScheduleModel.fromJson(json['dates'][0]);
    expect(json['dates'][0]['games'], isNotNull);

    final List<dynamic> jsonGames = json['dates'][0]['games'];
    final List<SCGameModel> games = jsonGames?.map<SCGameModel>((dynamic jsonGame) {
      final Map<String, dynamic> game = jsonGame;
      return game == null ? null : SCGameModel.fromJson(game);
    })?.toList();

    expect(schedule, isNotNull);
    expect(schedule.games.length, games.length);
    for (int i = 0; i < schedule.games.length; i++) {
      expect(schedule.games[i], games[i]);
    }
  });
}
