import 'package:flutter/material.dart';

String hostUrl = 'imdb8.p.rapidapi.com';

class Styles {
  static ThemeData themeData = ThemeData(
      primaryColor: Colors.black,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
      ),
      tabBarTheme: TabBarTheme(
        labelPadding: const EdgeInsets.all(8.0),
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.black),
      ));

  static const TextStyle labelStyle = TextStyle(
    color: Color.fromARGB(255, 255, 255, 255),
    fontSize: 16,
  );

  static const titleBigStyle = TextStyle(
    fontFamily: 'Rowdies',
    color: Color.fromARGB(255, 0, 0, 0),
    fontSize: 40,
  );

  static const TextStyle titleStyle = TextStyle(
    color: Color.fromARGB(255, 0, 0, 0),
    fontFamily: 'BebasNeue',
    fontWeight: FontWeight.bold,
    fontSize: 30,
  );

  static const TextStyle subtitleStyle = TextStyle(
    color: Color.fromARGB(255, 0, 0, 0),
    fontFamily: 'BebasNeue',
    fontSize: 26,
  );

  static const pagePadding = EdgeInsets.fromLTRB(8, 8, 8, 0);
}
