import 'package:filminfo/core/consts/app_consts.dart';
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
        BlocProvider<MovieCubit>(create: (ctx) => di.sl.call<MovieCubit>())
      ],
      child: MaterialApp(
        title: 'Filminfo',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        theme: Styles.themeData,
        routes: {
          SearchScreen.routeName: (_) => const SearchScreen(),
          MovieInfoScreen.routeName: (_) => const MovieInfoScreen(),
        },
      ),
    );
  }
}
