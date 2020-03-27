import 'package:baseball/src/models/models.dart';
import 'package:baseball/src/screens/details_screen.dart';
import 'package:baseball/src/screens/widgets/error.dart';
import 'package:baseball/src/screens/widgets/game_card.dart';
import 'package:baseball/src/services/mlb_api_client.dart';
import 'package:baseball/src/stores/stores.dart';
import 'package:baseball/src/utils/keys.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();

  static Route<dynamic> route(BuildContext context) {
    return MaterialPageRoute<void>(builder: (_) {
      return Provider<ScheduleStore>(
        create: (BuildContext _) => ScheduleStore(mlbApiClient: const MLBApiClient()),
        child: HomeScreen(),
      );
    });
  }
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _selectedDate = DateTime.now();
  ScheduleStore _scheduleStore;
  List<ReactionDisposer> _disposers;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scheduleStore ??= Provider.of<ScheduleStore>(context);
    _getTodaysSchedule();
    _disposers ??= <ReactionDisposer>[
      reaction(
        (_) => _scheduleStore.errorMessage,
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
    for (final ReactionDisposer d in _disposers) {
      d();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Center(child: Text(_getAppTitle())),
          actions: <Widget>[
            IconButton(
              key: AppWidgetKeys.keys['calendar'],
              icon: Icon(Icons.calendar_today),
              onPressed: () async => await _selectDate(context),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          alignment: Alignment.center,
          child: Observer(
            builder: (BuildContext _) {
              switch (_scheduleStore.state) {
                case ScheduleStoreState.initial:
                  if (_scheduleStore.errorMessage != null) {
                    return GestureDetector(
                      onTap: () async => _getTodaysSchedule(),
                      child: const Center(
                        child: NetworkErrorWidget(
                          title: 'No games found!',
                          subtitle: 'Tap to retry or select another date...',
                        ),
                      ),
                    );
                  }
                  return Container();
                case ScheduleStoreState.loading:
                  return const Center(child: SpinKitWave(color: Color(0xFFFD5A1E)));
                case ScheduleStoreState.loaded:
                  if (_scheduleStore.schedule.games.isEmpty) {
                    return Center(
                        child: GestureDetector(
                      onTap: () async => _getTodaysSchedule(),
                      child: const NetworkErrorWidget(title: 'No games found!'),
                    ));
                  }
                  return RefreshIndicator(
                    onRefresh: () async => _getTodaysSchedule(),
                    child: Center(
                      child: FractionallySizedBox(
                        widthFactor: 0.9,
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          itemCount: _scheduleStore.schedule.games.length,
                          itemBuilder: (BuildContext context, int index) {
                            final SCGameModel game = _scheduleStore.schedule.games[index];

                            return Hero(
                              tag: game.toString(),
                              child: GameCard(
                                game: game,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(),
                                ),
                                onTap: () async {
                                  await Navigator.push<void>(
                                    context,
                                    DetailsScreen.route(context, game),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  String _formatDate() => formatDate(_selectedDate, <String>[mm, '/', dd, '/', yyyy]);

  String _getAppTitle() {
    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);
    final DateTime yesterday = DateTime(now.year, now.month, now.day - 1);
    final DateTime tomorrow = DateTime(now.year, now.month, now.day + 1);

    if (_selectedDate == today) {
      return 'TODAY\'S GAMES';
    } else if (_selectedDate == yesterday) {
      return 'YESTERDAY\'S GAMES';
    } else if (_selectedDate == tomorrow) {
      return 'TOMORROW\'S GAMES';
    } else {
      final String day = _formatDate();
      return 'GAMES ON $day';
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000, 1),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != _selectedDate) {
      _selectedDate = picked;
      _getTodaysSchedule();
      setState(() {});
    }
  }

  void _getTodaysSchedule() {
    final String day = _formatDate();
    _scheduleStore.geSchedule(day);
  }
}
