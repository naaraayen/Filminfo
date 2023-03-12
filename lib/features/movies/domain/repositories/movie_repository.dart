import '../entities/movie_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> getPopularMovies();
  Future<List<MovieEntity>> getBestPictureWinners ();
  Future<List<MovieEntity>> getComingSoonMovies();
  Future<List<MovieEntity>> getTopRatedMovies();
  Future<List<MovieEntity>> getSearchMoviesList(String searchKeyword);
  Future<MovieEntity> findMovieById(String movieId);
}
