import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/movie_entity.dart';
import '../../domain/usecases/find_movie_by_id_usecase.dart';
import '../../domain/usecases/get_coming_soon_movies.dart';
import '../../domain/usecases/get_popular_movies.dart';
import '../../domain/usecases/get_search_movie_usecase.dart';
import '../../domain/usecases/get_top_rated_movies.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetComingSoonMoviesUsecase getComingSoonMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;
  final GetSearchMovieUsecase getSearchMovieUsecase;
  final FindMovieByIdUsecase findMovieByIdUsecase;
  MovieCubit({
    required this.getPopularMoviesUsecase,
    required this.getComingSoonMoviesUsecase,
    required this.getTopRatedMoviesUsecase,
    required this.getSearchMovieUsecase,
    required this.findMovieByIdUsecase,
  }) : super(MovieInitial());

  void fetchPopularMovies() async {
    emit(MovieFetching());
    try {
      final moviesList = await getPopularMoviesUsecase.call();
      emit(MovieFetched(moviesList));
    } catch (e) {
      emit(MovieFetchingError());
    }
  }

  void fetchComingSoonMovies() async {
    emit(MovieFetching());
    try {
      final moviesList = await getComingSoonMoviesUsecase.call();
      emit(MovieFetched(moviesList));
    } catch (e) {
      emit(MovieFetchingError());
    }
  }

  void fetchTopRatedMovies() async {
    emit(MovieFetching());
    try {
      final moviesList = await getTopRatedMoviesUsecase.call();
      emit(MovieFetched(moviesList));
    } catch (e) {
      emit(MovieFetchingError());
    }
  }

  void fetchSearchMovie(String searchKeyword) async {
    emit(MovieFetching());
    try {
      final moviesList = await getSearchMovieUsecase.call(searchKeyword);
      emit(MovieFetched(moviesList));
    } catch (e) {
      emit(MovieFetchingError());
    }
  }

  Future<MovieEntity> fetchMovieById(String movieId) async {
    try {
      final movie = await findMovieByIdUsecase.call(movieId);
      return movie;
    } catch (e) {
      throw Exception();
    }
  }
}
