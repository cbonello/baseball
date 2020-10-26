import 'package:baseball/src/models/models.dart';
import 'package:baseball/src/screens/widgets/game_card.dart';
import 'package:baseball/src/screens/widgets/players_stat.dart';
import 'package:baseball/src/services/mlb_api_client.dart';
import 'package:baseball/src/stores/stores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key key, @required this.game}) : super(key: key);

  final SCGameModel game;

  static MaterialPageRoute<void> route(BuildContext context, SCGameModel game) {
    return MaterialPageRoute<void>(
      builder: (_) {
        return Provider<LineScoreStore>(
          create: (BuildContext _) =>
              LineScoreStore(mlbApiClient: const MLBApiClient()),
          child: Provider<BoxScoreStore>(
              create: (BuildContext _) =>
                  BoxScoreStore(mlbApiClient: const MLBApiClient()),
              child: DetailsScreen(game: game)),
        );
      },
    );
  }

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  LineScoreStore _lineScoreStore;
  List<ReactionDisposer> _disposers;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  LineScoreModel _lineScore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _lineScoreStore ??= Provider.of<LineScoreStore>(context);
    _lineScoreStore.geSchedule(widget.game.gamePk.toString());
    _disposers ??= <ReactionDisposer>[
      reaction(
        (_) => _lineScoreStore.errorMessage,
        (String message) {
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(content: Text(message)),
          );
        },
      ),
    ];
  }

  @override
  void dispose() {
    for (final d in _disposers) {
      d();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Center(
            child: Text(
              '${widget.game.homeTeamNameShort} @ ${widget.game.awayTeamNameShort}',
            ),
          ),
        ),
        body: Observer(
          builder: (BuildContext _) {
            if (_lineScoreStore.state == LineScoreStoreState.loaded) {
              _lineScore = _lineScoreStore.lineScore;
            } else {
              _lineScore = null;
            }
            return Container(
              alignment: Alignment.topCenter,
              child: FractionallySizedBox(
                widthFactor: 0.9,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 20.0),
                      Hero(
                        tag: widget.game.toString(),
                        child: GameCard(game: widget.game),
                      ),
                      const SizedBox(height: 15.0),
                      Stack(
                        children: <Widget>[
                          ScoreSection(
                              game: widget.game, lineScore: _lineScore),
                          if (_lineScoreStore.state ==
                              LineScoreStoreState.loading)
                            const Center(
                                child: SpinKitWave(color: Color(0xFFFD5A1E))),
                        ],
                      ),
                      const SizedBox(height: 50.0),
                      PlayersStat(
                        scaffoldKey: _scaffoldKey,
                        game: widget.game,
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ScoreSection extends StatelessWidget {
  const ScoreSection({
    Key key,
    @required this.game,
    @required this.lineScore,
  }) : super(key: key);

  final SCGameModel game;
  final LineScoreModel lineScore;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.grey),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[200]),
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Text(''),
            ),
            for (int i = 1; i < 10; i++) Center(child: Text('$i')),
            const Center(
                child:
                    Text('R', style: TextStyle(fontWeight: FontWeight.bold))),
            const Center(
                child:
                    Text('H', style: TextStyle(fontWeight: FontWeight.bold))),
            const Center(
                child:
                    Text('E', style: TextStyle(fontWeight: FontWeight.bold))),
          ],
        ),
        TableRow(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 4.0, top: 5.0, bottom: 5.0),
              child: Text(game.homeTeamNameShort,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            Center(
              child:
                  Text(_getLineScoreInnings(0)?.home?.runs?.toString() ?? '0'),
            ),
            Center(
              child:
                  Text(_getLineScoreInnings(1)?.home?.runs?.toString() ?? '0'),
            ),
            Center(
              child:
                  Text(_getLineScoreInnings(2)?.home?.runs?.toString() ?? '0'),
            ),
            Center(
              child:
                  Text(_getLineScoreInnings(3)?.home?.runs?.toString() ?? '0'),
            ),
            Center(
              child:
                  Text(_getLineScoreInnings(4)?.home?.runs?.toString() ?? '0'),
            ),
            Center(
              child:
                  Text(_getLineScoreInnings(5)?.home?.runs?.toString() ?? '0'),
            ),
            Center(
              child:
                  Text(_getLineScoreInnings(6)?.home?.runs?.toString() ?? '0'),
            ),
            Center(
              child:
                  Text(_getLineScoreInnings(7)?.home?.runs?.toString() ?? '0'),
            ),
            Center(
              child:
                  Text(_getLineScoreInnings(8)?.home?.runs?.toString() ?? '0'),
            ),
            Center(
              child: Text(lineScore?.homeTeamTotalRuns?.toString() ?? '0'),
            ),
            Center(
              child: Text(lineScore?.homeTeamTotalHits?.toString() ?? '0'),
            ),
            Center(
              child: Text(lineScore?.homeTeamTotalErrors?.toString() ?? '0'),
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 4.0, top: 5.0, bottom: 5.0),
              child: Text(game.awayTeamNameShort,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            Center(
              child:
                  Text(_getLineScoreInnings(0)?.away?.runs?.toString() ?? '0'),
            ),
            Center(
              child:
                  Text(_getLineScoreInnings(1)?.away?.runs?.toString() ?? '0'),
            ),
            Center(
              child:
                  Text(_getLineScoreInnings(2)?.away?.runs?.toString() ?? '0'),
            ),
            Center(
              child:
                  Text(_getLineScoreInnings(3)?.away?.runs?.toString() ?? '0'),
            ),
            Center(
              child:
                  Text(_getLineScoreInnings(4)?.away?.runs?.toString() ?? '0'),
            ),
            Center(
              child:
                  Text(_getLineScoreInnings(5)?.away?.runs?.toString() ?? '0'),
            ),
            Center(
              child:
                  Text(_getLineScoreInnings(6)?.away?.runs?.toString() ?? '0'),
            ),
            Center(
              child:
                  Text(_getLineScoreInnings(7)?.away?.runs?.toString() ?? '0'),
            ),
            Center(
              child:
                  Text(_getLineScoreInnings(8)?.away?.runs?.toString() ?? '0'),
            ),
            Center(
              child: Text(lineScore?.awayTeamTotalRuns?.toString() ?? '0'),
            ),
            Center(
              child: Text(lineScore?.awayTeamTotalHits?.toString() ?? '0'),
            ),
            Center(
              child: Text(lineScore?.awayTeamTotalErrors?.toString() ?? '0'),
            ),
          ],
        ),
      ],
    );
  }

  LSInningModel _getLineScoreInnings(int inning) {
    if (lineScore?.innings?.isEmpty ?? true) {
      return null;
    }
    // Score may not be available if game is in progress.
    return inning < (lineScore?.innings?.length ?? 0)
        ? lineScore.innings[inning]
        : null;
  }
}

class BattersStatsSection extends StatelessWidget {
  const BattersStatsSection({
    Key key,
    @required this.game,
    @required this.players,
  }) : super(key: key);

  final SCGameModel game;
  final List<BSPlayerModel> players;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 5.0,
      columns: const <DataColumn>[
        DataColumn(
            label:
                Text('BATTERS', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(
            label: Text('AB', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(
            label: Text('R', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(
            label: Text('H', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(
            label: Text('RBI', style: TextStyle(fontWeight: FontWeight.bold))),
      ],
      rows: <DataRow>[
        for (final BSPlayerModel player in players)
          // Player didn't play?
          if (player.battingStats?.atBats != null &&
              player.battingStats?.runs != null &&
              player.battingStats?.hits != null &&
              player.battingStats?.strikeOuts != null)
            DataRow(
              cells: <DataCell>[
                DataCell(Text(player.fullName)),
                DataCell(Text(player.battingStats.atBats.toString())),
                DataCell(Text(player.battingStats.runs.toString())),
                DataCell(Text(player.battingStats.hits.toString())),
                DataCell(Text(player.battingStats.strikeOuts.toString())),
              ],
            )
      ],
    );
  }
}

class PitchersStatsSection extends StatelessWidget {
  const PitchersStatsSection({
    Key key,
    @required this.game,
    @required this.players,
  }) : super(key: key);

  final SCGameModel game;
  final List<BSPlayerModel> players;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 5.0,
      columns: const <DataColumn>[
        DataColumn(
            label: Text('PITCHERS',
                style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(
            label: Text('IP', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(
            label: Text('H', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(
            label: Text('r', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(
            label: Text('K', style: TextStyle(fontWeight: FontWeight.bold))),
      ],
      rows: <DataRow>[
        for (final BSPlayerModel player in players)
          // Player didn't play?
          if (player.pitchingStats?.inningsPitched != null &&
              player.pitchingStats?.hits != null &&
              player.pitchingStats?.runs != null &&
              player.pitchingStats?.strikeOuts != null)
            DataRow(
              cells: <DataCell>[
                DataCell(Text(player.fullName)),
                DataCell(Text(player.pitchingStats.inningsPitched.toString())),
                DataCell(Text(player.pitchingStats.hits.toString())),
                DataCell(Text(player.pitchingStats.runs.toString())),
                DataCell(Text(player.pitchingStats.strikeOuts.toString())),
              ],
            ),
      ],
    );
  }
}
