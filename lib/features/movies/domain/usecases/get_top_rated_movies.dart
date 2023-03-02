import '../entities/movie_entity.dart';
import '../repositories/movie_repository.dart';

class GetTopRatedMoviesUsecase {
  final MovieRepository movieRepository;

  GetTopRatedMoviesUsecase({required this.movieRepository});

  Future<List<MovieEntity>> call() {
    return movieRepository.getTopRatedMovies();
  }
}
