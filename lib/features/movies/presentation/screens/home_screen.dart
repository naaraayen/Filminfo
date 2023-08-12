import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/consts/app_consts.dart';
import '../../../../service_locater.dart';
import '../components/movie_list.dart';
import '../components/movie_tile.dart';
import '../cubit/movie_cubit.dart';
import 'search_screen.dart';

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
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(SearchScreen.routeName);
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                )),
          ],
        ),
        body: Padding(
          padding: Styles.pagePadding,
          child: Column(
            children: [
              BlocProvider<MovieCubit>(
                  create: (ctx) => sl.call<MovieCubit>(),
                  child: const MovieCarousel()),
              const SizedBox(height: 8.0),
              TabBar(
                  tabs: tabItems.map((item) {
                return Text(
                  item['label'],
                );
              }).toList()),
              const SizedBox(height: 8.0),
              Expanded(
                child: TabBarView(
                  children: tabItems.map((item) {
                    return BlocProvider<MovieCubit>(
                        create: (ctx) => sl.call<MovieCubit>(),
                        child: item['widget'] as Widget);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MovieCarousel extends StatefulWidget {
  const MovieCarousel({super.key});

  @override
  State<MovieCarousel> createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  @override
  void initState() {
    context.read<MovieCubit>().fetchBestPictureWinners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      width: double.infinity,
      child: BlocBuilder<MovieCubit, MovieState>(builder: (context, state) {
        if (state is MovieFetchingError) {
          return const Center(
            child: Text('Something Went Wrong'),
          );
        }
        if (state is MovieFetched) {
          return CarouselSlider(
            carouselController: CarouselController(),
            options: CarouselOptions(
              enableInfiniteScroll: true,
              enlargeFactor: 0.25,
              aspectRatio: 16 / 9,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              enlargeCenterPage: true,
              autoPlay: false,
            ),
            items: state.moviesList.map((item) {
              return Container(
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10.0)),
                child: FutureBuilder(
                  future: context
                      .read<MovieCubit>()
                      .findMovieByIdUsecase(item.id.toString()),
                  builder: (ctx, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something Went Wrong');
                    }
                    if (snapshot.hasData) {
                      return MovieTile(movieData: snapshot.data);
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              );
            }).toList(),
          );
        }
        return const Center(child: CircularProgressIndicator());
      }),
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
