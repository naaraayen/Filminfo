import '../entities/movie_entity.dart';
import '../repositories/movie_repository.dart';

class GetComingSoonMoviesUsecase {
  final MovieRepository movieRepository;

  GetComingSoonMoviesUsecase({required this.movieRepository});

  Future<List<MovieEntity>> call() async {
    return movieRepository.getComingSoonMovies();
  }

}
