import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/movie_cubit.dart';
import 'movie_tile.dart';

class MovieList extends StatefulWidget {
  final VoidCallback usecase;

  const MovieList({
    Key? key,
    required this.usecase,
  }) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    widget.usecase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<MovieCubit, MovieState>(builder: (context, state) {
      if (state is MovieFetchingError) {
        return const Center(
          child: Text('Error Fetching'),
        );
      }
      if (state is MovieFetched) {
        return GridView.builder(
            itemCount: state.moviesList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 8.0, crossAxisSpacing: 8.0,childAspectRatio: 1),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10.0)),
                child: FutureBuilder(
                  future: context.read<MovieCubit>().findMovieByIdUsecase(
                      state.moviesList[index].id.toString()),
                  builder: (ctx, snapshot) {
                    if (snapshot.hasError) {
                      return  const Center(child: Text('Something Went Wrong'));
                    }
                    if (snapshot.hasData) {
                      return MovieTile(movieData: snapshot.data);
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              );
            });
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }

  @override
  bool get wantKeepAlive => true;
}
