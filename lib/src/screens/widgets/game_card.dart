import 'package:baseball/src/models/models.dart';
import 'package:baseball/src/screens/widgets/team_avatar.dart';
import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    Key key,
    @required this.game,
    this.decoration,
    this.onTap,
  }) : super(key: key);

  final SCGameModel game;
  final Decoration decoration;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    // Reduce size and spacing between widgets for small devices.
    final dense = MediaQuery.of(context).size.width < 350;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          decoration: decoration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                height: 85.0,
                child: Row(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TeamAvatar(
                          asset: game.homeTeamAsset,
                          radius: dense ? 25.0 : 30.0,
                        ),
                        const SizedBox(height: 1.0),
                        Text(
                          game.homeTeamNameShort,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: dense ? 4.0 : 30.0),
                      child: Text(
                        game.homeTeamScore?.toString() ?? '0',
                        style: const TextStyle(fontSize: 26.0),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                game.gameStatus,
                overflow: TextOverflow.clip,
                style: TextStyle(fontSize: dense ? 18.0 : 22.0),
              ),
              Container(
                height: 85.0,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: dense ? 4.0 : 30.0),
                      child: Text(
                        game.awayTeamScore?.toString() ?? '0',
                        style: const TextStyle(fontSize: 26.0),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TeamAvatar(
                          asset: game.awayTeamAsset,
                          radius: dense ? 25.0 : 30.0,
                        ),
                        const SizedBox(height: 1.0),
                        Text(
                          game.awayTeamNameShort,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
