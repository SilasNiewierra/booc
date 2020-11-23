import 'package:boek/app_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeData _themeData = new ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Roboto',
    primaryColor: Colors.teal,
    accentColor: Colors.green,
    buttonColor: Colors.amber,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _themeData,
      home: AppHandler(),
    );
  }
}
