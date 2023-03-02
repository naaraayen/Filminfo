import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../service_locater.dart';
import '../../../../core/consts/app_consts.dart';
import '../components/movie_list.dart';
import '../cubit/movie_cubit.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/HomeScreen';
  HomeScreen({super.key});
  final List<Map<String, dynamic>> tabItems = [
    {
      'label': 'Popular',
      'widget': const PopularMovies(),
    },
    {
      'label': 'Top Rated',
      'widget': const TopRatedMovies(),
    },
    {
      'label': 'Coming Soon',
      'widget': const ComingSoonMovies(),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabItems.length,
      child: Scaffold(
        appBar: AppBar(
            elevation: 1.0,
            automaticallyImplyLeading: false,
            titleSpacing: 4.0,
            title: const Text(
              'Filiminfo',
              style: Styles.titleBigStyle,
            ),
            bottom: TabBar(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                tabs: tabItems.map((item) {
                  return Text(
                    item['label'],
                  );
                }).toList())),
        body: Padding(
          padding: Styles.pagePadding,
          child: TabBarView(
            children: tabItems.map((item) {
              return BlocProvider<MovieCubit>(
                  create: (ctx) => sl.call(), child: item['widget'] as Widget);
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class PopularMovies extends StatelessWidget {
  const PopularMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return MovieList(usecase: context.read<MovieCubit>().fetchPopularMovies);
  }
}

class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return MovieList(usecase: context.read<MovieCubit>().fetchTopRatedMovies);
  }
}

class ComingSoonMovies extends StatelessWidget {
  const ComingSoonMovies({super.key});
  @override
  Widget build(BuildContext context) {
    return MovieList(usecase: context.read<MovieCubit>().fetchComingSoonMovies);
  }
}
