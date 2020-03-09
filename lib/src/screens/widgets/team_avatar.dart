import 'package:flutter/material.dart';

class TeamAvatar extends StatelessWidget {
  const TeamAvatar({
    Key key,
    @required this.asset,
    this.backgroundColor,
    this.radius = 30.0,
    this.onTap,
  }) : super(key: key);

  final String asset;
  final Color backgroundColor;
  final double radius;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: radius * 2,
        width: radius * 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor ?? Colors.white,
        ),
        child: Center(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: Image.asset(asset),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
