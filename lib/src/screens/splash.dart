import 'dart:async';

import 'package:baseball/src/screens/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Image _mlbLogo;

  @override
  void initState() {
    super.initState();
    _mlbLogo = Image.asset('assets/mlb_logo.png');
  }

  @override
  Future<void> didChangeDependencies() async {
    await precacheImage(_mlbLogo.image, context);
    startTimer();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: <Widget>[
              const Spacer(flex: 2),
              FractionallySizedBox(
                widthFactor: 0.6,
                child: _mlbLogo,
              ),
              const Text(
                'powered by',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40.0),
              const Text(
                'statsapi.mlb.com',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'roboto_mono',
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }

  Timer startTimer() {
    const duration = Duration(seconds: 3);
    return Timer(duration, navigate);
  }

  Future<void> navigate() async {
    await Navigator.of(context).pushReplacement(HomeScreen.route(context));
  }
}
