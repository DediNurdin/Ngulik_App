import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData(
    // splashColor: Colors.transparent,
    // highlightColor: Colors.transparent,
    brightness: Brightness.light,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.white,
    // fontFamily: 'Georgia',
    // textTheme: const TextTheme(
    //   displayLarge: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
    //   titleLarge: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
    // ),
  );

  static final dark = ThemeData(
    // splashColor: Colors.transparent,
    // highlightColor: Colors.transparent,
    brightness: Brightness.dark,
    primaryColor: Colors.lightBlue[800],
    scaffoldBackgroundColor: Colors.black45,
    // fontFamily: 'TiltPrism',
    // textTheme: const TextTheme(
    //   displayLarge: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
    //   titleLarge: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
    // ),
    // buttonTheme: const ButtonThemeData(buttonColor: Colors.white)
  );
}
