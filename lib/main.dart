import 'package:baseball/src/screens/splash.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as services;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  services.SystemChrome.setPreferredOrientations(<services.DeviceOrientation>[
    services.DeviceOrientation.portraitUp,
    services.DeviceOrientation.portraitDown,
  ]);

  runApp(
    DevicePreview(
      enabled: false, //!kReleaseMode,
      builder: (BuildContext context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SimpleBet',
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.of(context).locale,
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        fontFamily: 'Lato',
        primaryColor: const Color(0xFFFD5A1E),
        accentColor: Colors.blue,
        brightness: Brightness.light,
      ),
      home: SplashScreen(),
    );
  }
}
