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
    primaryColor: HexColor('#2755FF'),
    accentColor: HexColor('#DC3735'),
    buttonColor: HexColor('#DC3735'),
    textTheme: TextTheme(
      headline1: TextStyle(
          color: HexColor('#09071D'),
          fontSize: 40.0,
          fontWeight: FontWeight.w900),
      headline2: TextStyle(
          color: HexColor('#09071D'),
          fontSize: 30.0,
          fontWeight: FontWeight.w900),
      headline3: TextStyle(
          color: HexColor('#09071D'),
          fontSize: 25.0,
          fontWeight: FontWeight.w900),
      headline4: TextStyle(
          color: HexColor('#09071D'),
          fontSize: 20.0,
          fontWeight: FontWeight.w900),
      subtitle1: TextStyle(
          color: HexColor('#09071D'),
          fontSize: 15.0,
          fontWeight: FontWeight.w900),
      subtitle2: TextStyle(color: HexColor('#A6ABBC')),
      bodyText1: TextStyle(
        color: HexColor('#A6ABBC'),
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
