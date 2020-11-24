import 'package:boek/app_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeData _themeData = new ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Roboto',
    primaryColor: Colors.blue[100],
    accentColor: HexColor('#DC3735'),
    buttonColor: HexColor('#DC3735'),
    textTheme: TextTheme(
      // Title
      headline1: TextStyle(
          color: Colors.blueGrey[900],
          fontSize: 40.0,
          fontWeight: FontWeight.w900),
      // Greetig Text
      headline2: TextStyle(
          color: Colors.blueGrey[900],
          fontSize: 40.0,
          fontWeight: FontWeight.w900),
      // Section Text
      headline3: TextStyle(
          color: Colors.blueGrey[900],
          fontSize: 25.0,
          fontWeight: FontWeight.w900),
      // Book Title
      headline4: TextStyle(
          color: Colors.blueGrey[900],
          fontSize: 20.0,
          fontWeight: FontWeight.w900),
      // Subtitle Heading
      subtitle1: TextStyle(
          color: Colors.blueGrey[900],
          fontSize: 20.0,
          fontWeight: FontWeight.w900),
      // Author
      subtitle2: TextStyle(color: HexColor('#A6ABBC'), fontSize: 20.0),
      // Description
      bodyText1: TextStyle(
        color: HexColor('#A6ABBC'),
        fontSize: 20.0,
      ),
    ),
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
