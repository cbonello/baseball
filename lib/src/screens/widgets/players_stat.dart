import 'dart:math' as math;

import 'package:baseball/src/models/models.dart';
import 'package:baseball/src/screens/widgets/tab_selector.dart';
import 'package:baseball/src/stores/stores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

enum TabModel { home, away }

class PlayersStat extends StatefulWidget {
  const PlayersStat({
    Key key,
    @required this.scaffoldKey,
    @required this.game,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;
  final SCGameModel game;

  @override
  _PlayersStatState createState() => _PlayersStatState();
}

class _PlayersStatState extends State<PlayersStat> {
  BoxScoreStore _boxScoreStore;
  List<ReactionDisposer> _disposers;
  TabModel selectedTab;
  BoxScoreModel _boxScore;

  @override
  void initState() {
    selectedTab = TabModel.home;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _boxScoreStore ??= Provider.of<BoxScoreStore>(context);
    _boxScoreStore.geSchedule(widget.game.gamePk.toString());
    _disposers ??= <ReactionDisposer>[
      reaction(
        (_) => _boxScoreStore.errorMessage,
        (String message) {
          widget.scaffoldKey.currentState.showSnackBar(
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
    return Observer(
      builder: (BuildContext _) {
        if (_boxScoreStore.state == BoxScoreStoreState.loaded) {
          _boxScore = _boxScoreStore.boxScore;
        } else {
          _boxScore = null;
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TabSelector(
              homeTeamName: widget.game.homeTeamNameShort,
              awayTeamName: widget.game.awayTeamNameShort,
              selectedTab: selectedTab,
              onTap: (TabModel tab) {
                setState(() => selectedTab = tab);
              },
            ),
            const SizedBox(height: 30.0),
            const Text(
              'Batters',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15.0),
            Stack(
              children: <Widget>[
                if (selectedTab == TabModel.home)
                  BattersStatsSection(
                    game: widget.game,
                    players: _boxScore?.homeBatters ?? <BSPlayerModel>[],
                  )
                else
                  BattersStatsSection(
                    game: widget.game,
                    players: _boxScore?.awayBatters ?? <BSPlayerModel>[],
                  ),
                if (_boxScoreStore.state == BoxScoreStoreState.loading)
                  const Center(child: SpinKitWave(color: Color(0xFFFD5A1E))),
              ],
            ),
            const SizedBox(height: 30.0),
            const Text(
              'Pitchers',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15.0),
            if (selectedTab == TabModel.home)
              PitchersStatsSection(
                game: widget.game,
                players: _boxScore?.homePitchers ?? <BSPlayerModel>[],
              )
            else
              PitchersStatsSection(
                game: widget.game,
                players: _boxScore?.awayPitchers ?? <BSPlayerModel>[],
              ),
          ],
        );
      },
    );
  }
}

BSPlayerModel _getPlayer(List<BSPlayerModel> players, int index) {
  if (players == null || players.isEmpty || index > players.length) {
    return null;
  }
  return players[index];
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
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.75,
        child: Table(
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(2.0),
            1: FlexColumnWidth(1.0),
            2: FlexColumnWidth(1.0),
            3: FlexColumnWidth(1.0),
            4: FlexColumnWidth(1.0),
          },
          border: TableBorder.all(color: Colors.grey),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: <TableRow>[
            const TableRow(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 4.0, top: 5.0, bottom: 5.0),
                  child: Text('BATTERS', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Center(child: Text('AB', style: TextStyle(fontWeight: FontWeight.bold))),
                Center(child: Text('R', style: TextStyle(fontWeight: FontWeight.bold))),
                Center(child: Text('H', style: TextStyle(fontWeight: FontWeight.bold))),
                Center(child: Text('RBI', style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
            // Shimmer effect: display one dummy row when loading.
            for (int i = 0; i < math.max(players.length, 1); i++)
              TableRow(
                decoration:
                    BoxDecoration(color: i.isOdd ? Colors.white : Colors.grey[200]),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0, top: 5.0, bottom: 5.0),
                    child: Text(_getPlayer(players, i)?.fullName ?? '...'),
                  ),
                  Center(
                    child: Text(
                      _getPlayer(players, i)?.battingStats?.atBats?.toString() ?? '0',
                    ),
                  ),
                  Center(
                    child: Text(
                      _getPlayer(players, i)?.battingStats?.runs?.toString() ?? '0',
                    ),
                  ),
                  Center(
                    child: Text(
                      _getPlayer(players, i)?.battingStats?.hits?.toString() ?? '0',
                    ),
                  ),
                  Center(
                    child: Text(
                      _getPlayer(players, i)?.battingStats?.strikeOuts?.toString() ?? '0',
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
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
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.75,
        child: Table(
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(2.0),
            1: FlexColumnWidth(1.0),
            2: FlexColumnWidth(1.0),
            3: FlexColumnWidth(1.0),
            4: FlexColumnWidth(1.0),
          },
          border: TableBorder.all(color: Colors.grey),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: <TableRow>[
            const TableRow(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 4.0, top: 5.0, bottom: 5.0),
                  child: Text('PITCHERS', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Center(child: Text('IP', style: TextStyle(fontWeight: FontWeight.bold))),
                Center(child: Text('H', style: TextStyle(fontWeight: FontWeight.bold))),
                Center(child: Text('R', style: TextStyle(fontWeight: FontWeight.bold))),
                Center(child: Text('K', style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
            for (int i = 0; i < math.max(players.length, 1); i++)
              TableRow(
                decoration:
                    BoxDecoration(color: i.isOdd ? Colors.white : Colors.grey[200]),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0, top: 5.0, bottom: 5.0),
                    child: Text(_getPlayer(players, i)?.fullName ?? '...'),
                  ),
                  Center(
                    child: Text(
                      _getPlayer(players, i)?.pitchingStats?.inningsPitched?.toString() ??
                          '0',
                    ),
                  ),
                  Center(
                    child: Text(
                      _getPlayer(players, i)?.pitchingStats?.hits?.toString() ?? '0',
                    ),
                  ),
                  Center(
                    child: Text(
                      _getPlayer(players, i)?.pitchingStats?.runs?.toString() ?? '0',
                    ),
                  ),
                  Center(
                    child: Text(
                      _getPlayer(players, i)?.pitchingStats?.strikeOuts?.toString() ??
                          '0',
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );

    // return DataTable(
    //   columnSpacing: 5.0,
    //   columns: <DataColumn>[
    //     DataColumn(
    //         label: Text('PITCHERS', style: TextStyle(fontWeight: FontWeight.bold))),
    //     DataColumn(label: Text('IP', style: TextStyle(fontWeight: FontWeight.bold))),
    //     DataColumn(label: Text('H', style: TextStyle(fontWeight: FontWeight.bold))),
    //     DataColumn(label: Text('r', style: TextStyle(fontWeight: FontWeight.bold))),
    //     DataColumn(label: Text('K', style: TextStyle(fontWeight: FontWeight.bold))),
    //   ],
    //   rows: <DataRow>[
    //     for (final player in players)
    //       // Player didn't play?
    //       if (player.pitchingStats?.inningsPitched != null &&
    //           player.pitchingStats?.hits != null &&
    //           player.pitchingStats?.runs != null &&
    //           player.pitchingStats?.strikeOuts != null)
    //         DataRow(
    //           cells: <DataCell>[
    //             DataCell(Text(player.fullName)),
    //             DataCell(Text(player.pitchingStats.inningsPitched.toString())),
    //             DataCell(Text(player.pitchingStats.hits.toString())),
    //             DataCell(Text(player.pitchingStats.runs.toString())),
    //             DataCell(Text(player.pitchingStats.strikeOuts.toString())),
    //           ],
    //         ),
    //   ],
    // );
  }
}
