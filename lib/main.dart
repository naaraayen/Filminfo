import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'service_locater.dart' as di;

import 'features/movies/presentation/screens/home_screen.dart';
import 'features/movies/presentation/screens/movie_info_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.setup();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Filminfo',
      home: HomeScreen(),
      theme: ThemeData(
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
          )),
      routes: {
        MovieInfoScreen.routeName: (_) => const MovieInfoScreen(),
      },
    );
  }
}
