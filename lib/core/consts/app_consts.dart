import 'package:flutter/material.dart';

String hostUrl = 'imdb8.p.rapidapi.com';


class Styles {
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
