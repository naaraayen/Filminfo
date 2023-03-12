import '../../domain/entities/movie_entity.dart';
import '../../domain/repositories/movie_repository.dart';
import '../data_sources/remote/remote_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  final RemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});
  @override
  Future<List<MovieEntity>> getComingSoonMovies() {
    return remoteDataSource.getComingSoonMovies();
  }

  @override
  Future<List<MovieEntity>> getPopularMovies() {
    return remoteDataSource.getPopularMovies();
  }

  @override
  Future<List<MovieEntity>> getBestPictureWinners() {
    return remoteDataSource.getBestPictureWinners();
  }

  @override
  Future<List<MovieEntity>> getTopRatedMovies() {
    return remoteDataSource.getTopRatedMovies();
  }

  @override
  Future<List<MovieEntity>> getSearchMoviesList(String searchKeyword) {
    return remoteDataSource.getSearchMoviesList(searchKeyword);
  }

  @override
  Future<MovieEntity> findMovieById(String movieId) {
    return remoteDataSource.findMovieInfoById(movieId);
  }
}
