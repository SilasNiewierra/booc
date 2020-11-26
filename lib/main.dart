import 'package:booc/app_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppHandler(),
      theme: ThemeData(
        primaryColor: Colors.blueGrey[900],
        accentColor: Colors.blueGrey[900],
      ),
      // Swipe Navigation Gesture -- Destroys pop up effect of menu
      // theme: ThemeData(
      //     pageTransitionsTheme: PageTransitionsTheme(builders: {
      //   TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      //   TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      // })),
    );
  }
}
