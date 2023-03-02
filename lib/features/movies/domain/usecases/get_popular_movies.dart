import '../entities/movie_entity.dart';
import '../repositories/movie_repository.dart';

class GetPopularMoviesUsecase {
  final MovieRepository movieRepository;
  GetPopularMoviesUsecase({required this.movieRepository});

  Future<List<MovieEntity>> call() {
    return movieRepository.getPopularMovies();
  }
}
