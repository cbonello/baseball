import 'dart:math' as math;

import 'package:baseball/src/screens/widgets/players_stat.dart';
import 'package:flutter/material.dart';

class TabSelector extends StatelessWidget {
  const TabSelector({
    Key key,
    @required this.homeTeamName,
    @required this.awayTeamName,
    @required this.selectedTab,
    @required this.onTap,
  }) : super(key: key);

  final String homeTeamName, awayTeamName;
  final TabModel selectedTab;
  final Function(TabModel) onTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext _, BoxConstraints constraints) {
        final double width = math.min(constraints.maxWidth * 0.6, 400);

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: selectedTab == TabModel.home ? null : () => onTap(TabModel.home),
              child: SizedBox(
                // To respect the width/height ration of the design document.
                width: width / 2,
                height: width * 0.7 / 4,
                child: SemiRoundedBorderButtonLeft(
                  borderSide: const BorderSide(color: Colors.black, width: 2.0),
                  radius: const Radius.circular(30.0),
                  background: selectedTab == TabModel.home ? Colors.black : Colors.white,
                  child: Center(
                    child: Text(
                      homeTeamName,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: selectedTab == TabModel.home ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: selectedTab == TabModel.away ? null : () => onTap(TabModel.away),
              child: SizedBox(
                width: width / 2,
                height: width * 0.7 / 4,
                child: SemiRoundedBorderButtonRight(
                  borderSide: const BorderSide(color: Colors.black, width: 2.0),
                  radius: const Radius.circular(30.0),
                  background: selectedTab == TabModel.away ? Colors.black : Colors.white,
                  child: Center(
                    child: Text(
                      awayTeamName,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: selectedTab == TabModel.away ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class SemiRoundedBorderButtonLeft extends StatelessWidget {
  const SemiRoundedBorderButtonLeft({
    Key key,
    @required this.borderSide,
    @required this.radius,
    @required this.background,
    @required this.child,
  }) : super(key: key);

  final BorderSide borderSide;
  final Radius radius;
  final Color background;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: ShapeDecoration(
        color: background,
        shape: RoundedRectangleBorder(
          side: borderSide,
          borderRadius: BorderRadius.only(
            topLeft: radius,
            bottomLeft: radius,
          ),
        ),
      ),
      child: child,
    );
  }
}

class SemiRoundedBorderButtonRight extends StatelessWidget {
  const SemiRoundedBorderButtonRight({
    Key key,
    @required this.borderSide,
    @required this.radius,
    @required this.background,
    @required this.child,
  }) : super(key: key);

  final BorderSide borderSide;
  final Radius radius;
  final Color background;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: ShapeDecoration(
        color: background,
        shape: RoundedRectangleBorder(
          side: borderSide,
          borderRadius: BorderRadius.only(
            topRight: radius,
            bottomRight: radius,
          ),
        ),
      ),
      child: child,
    );
  }
}
