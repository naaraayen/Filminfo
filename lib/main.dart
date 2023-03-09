import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'features/movies/presentation/cubit/movie_cubit.dart';
import 'features/movies/presentation/screens/search_screen.dart';
import 'features/movies/presentation/screens/home_screen.dart';
import 'features/movies/presentation/screens/movie_info_screen.dart';

import 'service_locater.dart' as di;
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieCubit>(create: (ctx)=> di.sl.call<MovieCubit>())
      ],
      child: MaterialApp(
        title: 'Filminfo',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        theme: ThemeData(
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
            )),
        routes: {
          SearchScreen.routeName: (_) => const SearchScreen(),
          MovieInfoScreen.routeName: (_) => const MovieInfoScreen(),
        },
      ),
    );
  }
}
