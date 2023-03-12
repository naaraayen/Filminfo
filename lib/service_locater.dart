import 'package:filminfo/features/movies/domain/usecases/get_best_picture_winners.dart';
import 'package:get_it/get_it.dart';

import 'features/movies/data/data_sources/remote/remote_data_source.dart';
import 'features/movies/data/data_sources/remote/remote_data_source_impl.dart';

import 'features/movies/domain/repositories/movie_repository.dart';
import 'features/movies/data/repositories/movie_repository_impl.dart';

import 'features/movies/domain/usecases/find_movie_by_id_usecase.dart';
import 'features/movies/domain/usecases/get_popular_movies.dart';
import 'features/movies/domain/usecases/get_coming_soon_movies.dart';
import 'features/movies/domain/usecases/get_search_movie_usecase.dart';
import 'features/movies/domain/usecases/get_top_rated_movies.dart';

import 'features/movies/presentation/cubit/movie_cubit.dart';

GetIt sl = GetIt.instance;

void setup() {
  // Data source
  sl.registerSingleton<RemoteDataSource>(RemoteDataSourceImpl());

  // Repository
  sl.registerSingleton<MovieRepository>(
      MovieRepositoryImpl(remoteDataSource: sl.call()));

  // Usecase
  sl.registerSingleton<GetPopularMoviesUsecase>(
      GetPopularMoviesUsecase(movieRepository: sl.call<MovieRepository>()));
  sl.registerSingleton<GetComingSoonMoviesUsecase>(
      GetComingSoonMoviesUsecase(movieRepository: sl.call<MovieRepository>()));
  sl.registerSingleton<GetTopRatedMoviesUsecase>(
      GetTopRatedMoviesUsecase(movieRepository: sl.call<MovieRepository>()));
  sl.registerSingleton<GetSearchMovieUsecase>(
      GetSearchMovieUsecase(movieRepository: sl.call<MovieRepository>()));
  sl.registerSingleton<FindMovieByIdUsecase>(
      FindMovieByIdUsecase(movieRepository: sl.call<MovieRepository>()));
  sl.registerSingleton<GetBestPictureWinnersUsecase>(GetBestPictureWinnersUsecase(movieRepository: sl.call<MovieRepository>()));

  // Cubit
  sl.registerFactory<MovieCubit>(() => MovieCubit(
      getPopularMoviesUsecase: sl.call<GetPopularMoviesUsecase>(),
      getComingSoonMoviesUsecase: sl.call<GetComingSoonMoviesUsecase>(),
      getTopRatedMoviesUsecase: sl.call<GetTopRatedMoviesUsecase>(),
      getSearchMovieUsecase: sl.call<GetSearchMovieUsecase>(),
      findMovieByIdUsecase: sl.call<FindMovieByIdUsecase>(),
      getBestPictureWinnersUsecase: sl.call<GetBestPictureWinnersUsecase>()));
}
