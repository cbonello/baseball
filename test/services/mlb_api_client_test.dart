import 'dart:convert';
import 'dart:io';

import 'package:baseball/src/models/models.dart';
import 'package:baseball/src/services/mlb_api_client.dart';
import 'package:baseball/src/services/web_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockWebClient extends Mock implements WebClient {}

void main() {
  test('API Request #1 - Game Schedule', () async {
    final File file = File('test/support/schedule.json');
    final Map<String, dynamic> json = jsonDecode(await file.readAsString());

    final WebClient webClient = MockWebClient();
    when(webClient.get(any)).thenAnswer((_) {
      return Future<dynamic>.value(json);
    });
    final MLBApiClient mlbApi = MLBApiClient(webClient);

    final SCScheduleModel schedule = await mlbApi.getGameSchedule('3/4/2020');
    expect(schedule.games.length, equals(4));
  });

  test('API Request #2 - Game Linescore', () async {
    final File file = File('test/support/line_score.json');
    final Map<String, dynamic> json = jsonDecode(await file.readAsString());

    final WebClient webClient = MockWebClient();
    when(webClient.get(any)).thenAnswer((_) {
      return Future<dynamic>.value(json);
    });
    final MLBApiClient mlbApi = MLBApiClient(webClient);

    final LineScoreModel lineScore = await mlbApi.getGameLinescoreSchedule('599337');
    expect(lineScore.innings.length, equals(9));
  });

  test('API Request #3 - Player Game Stats / Boxscore', () async {
    final File file = File('test/support/box_score.json');
    final Map<String, dynamic> json = jsonDecode(await file.readAsString());

    final WebClient webClient = MockWebClient();
    when(webClient.get(any)).thenAnswer((_) {
      return Future<dynamic>.value(json);
    });
    final MLBApiClient mlbApi = MLBApiClient(webClient);

    final BoxScoreModel boxScore = await mlbApi.getGameBoxscoreSchedule('599337');
    expect(boxScore.awayBatters.length, equals(16));
  });
}
