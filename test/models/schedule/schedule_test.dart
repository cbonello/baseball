import 'dart:convert';
import 'dart:io';

import 'package:baseball/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Parses SCGameModel', () async {
    final file = File('test/support/schedule.json');
    final dynamic json = jsonDecode(await file.readAsString());
    expect(json['dates'], isNotNull);
    expect(json['dates'], isNotEmpty);

    final schedule = SCScheduleModel.fromJson(json['dates'][0]);
    expect(json['dates'][0]['games'], isNotNull);

    final List<dynamic> jsonGames = json['dates'][0]['games'];
    final games = jsonGames?.map<SCGameModel>((dynamic jsonGame) {
      final Map<String, dynamic> game = jsonGame;
      return game == null ? null : SCGameModel.fromJson(game);
    })?.toList();

    expect(schedule, isNotNull);
    expect(schedule.games.length, games.length);
    for (var i = 0; i < schedule.games.length; i++) {
      expect(schedule.games[i], games[i]);
    }
  });
}
