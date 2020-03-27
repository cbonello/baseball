import 'package:baseball/src/models/models.dart';
import 'package:baseball/src/services/web_client.dart';

abstract class MLBApiClientInterface {
  Future<SCScheduleModel> getGameSchedule(String date);
  Future<LineScoreModel> getGameLinescoreSchedule(String gameId);
  Future<BoxScoreModel> getGameBoxscoreSchedule(String gameId);
}

class MLBApiClient {
  const MLBApiClient([this.client = const WebClient()]);

  final WebClient client;
  static const String baseURL = 'https://statsapi.mlb.com/api/v1';

  String gameScheduleUrl(String date) {
    const queryFields =
        'dates,games,gamePk,gameDate,status,detailedState,venue,teams,score,leagueRecord,wins,losses,team,name,isWinner';
    final url =
        '$baseURL/schedule/?sportId=1&startDate=$date&endDate=$date&fields=$queryFields';
    return url;
  }

  String gameLinescoreUrl(String gameId) {
    final url = '$baseURL/game/$gameId/linescore';
    return url;
  }

  String gameBoxscoreUrl(String gameId) {
    const queryFields =
        'teams,record,wins,losses,players,fullName,position,name,type,abbreviation,stats,batting,doubles,triples,homeRuns,strikeOuts,fielding,assists,errors,putOuts,pitching,runs,atBats,hits,rbi,inningsPitched,strikeOuts';
    final url = '$baseURL/game/$gameId/boxscore?fields=$queryFields';
    return url;
  }

  Future<SCScheduleModel> getGameSchedule(String date) async {
    final url = gameScheduleUrl(date);
    final Map<String, dynamic> json = await client.get(url);

    assert(json['dates'] != null);
    if (json['dates'].length >= 1) {
      SCScheduleModel schedule;
      try {
        schedule = SCScheduleModel.fromJson(json['dates'][0]);
      } catch (exception) {
        throw Exception('Unexpected data received from server');
      }
      return schedule;
    } else {
      throw Exception('No games scheduled on $date');
    }
  }

  Future<LineScoreModel> getGameLinescoreSchedule(String gameId) async {
    final url = gameLinescoreUrl(gameId);
    final Map<String, dynamic> json = await client.get(url);

    // throw Exception('Bar error');

    try {
      final lineScore = LineScoreModel.fromJson(json);
      return lineScore;
    } catch (exception) {
      throw Exception('Unexpected data received from server');
    }
  }

  Future<BoxScoreModel> getGameBoxscoreSchedule(String gameId) async {
    final url = gameBoxscoreUrl(gameId);
    final Map<String, dynamic> json = await client.get(url);

    try {
      final boxScore = BoxScoreModel.fromJson(json);
      return boxScore;
    } catch (exception) {
      throw Exception('Unexpected data received from server');
    }
  }
}
