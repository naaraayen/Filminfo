import '../../../domain/entities/movie_entity.dart';

abstract class RemoteDataSource {
  Future<List<MovieEntity>> getPopularMovies();
  Future<List<MovieEntity>> getBestPictureWinners();
  Future<List<MovieEntity>> getComingSoonMovies();
  Future<List<MovieEntity>> getTopRatedMovies();
  Future<List<MovieEntity>> getSearchMoviesList(String searchKeyword);
  Future<MovieEntity> findMovieInfoById(String movieId);
}
