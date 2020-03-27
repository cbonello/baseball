import 'dart:convert';
import 'dart:io';

import 'package:baseball/src/services/mlb_api_client.dart';
import 'package:baseball/src/services/web_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockWebClient extends Mock implements WebClient {}

void main() {
  test('API Request #1 - Game Schedule', () async {
    final file = File('test/support/schedule.json');
    final Map<String, dynamic> json = jsonDecode(await file.readAsString());

    final WebClient webClient = MockWebClient();
    when(webClient.get(any)).thenAnswer((_) {
      return Future<dynamic>.value(json);
    });
    final mlbApi = MLBApiClient(webClient);

    final schedule = await mlbApi.getGameSchedule('3/4/2020');
    expect(schedule.games.length, equals(4));
  });

  test('API Request #2 - Game Linescore', () async {
    final file = File('test/support/line_score.json');
    final Map<String, dynamic> json = jsonDecode(await file.readAsString());

    final WebClient webClient = MockWebClient();
    when(webClient.get(any)).thenAnswer((_) {
      return Future<dynamic>.value(json);
    });
    final mlbApi = MLBApiClient(webClient);

    final lineScore = await mlbApi.getGameLinescoreSchedule('599337');
    expect(lineScore.innings.length, equals(9));
  });

  test('API Request #3 - Player Game Stats / Boxscore', () async {
    final file = File('test/support/box_score.json');
    final Map<String, dynamic> json = jsonDecode(await file.readAsString());

    final WebClient webClient = MockWebClient();
    when(webClient.get(any)).thenAnswer((_) {
      return Future<dynamic>.value(json);
    });
    final mlbApi = MLBApiClient(webClient);

    final boxScore = await mlbApi.getGameBoxscoreSchedule('599337');
    expect(boxScore.awayBatters.length, equals(16));
  });
}
