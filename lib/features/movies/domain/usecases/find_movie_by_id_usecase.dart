import '../entities/movie_entity.dart';
import '../repositories/movie_repository.dart';

class FindMovieByIdUsecase {
  MovieRepository movieRepository;
  FindMovieByIdUsecase({
    required this.movieRepository,
  });

  Future<MovieEntity> call(String movieId) {
    return movieRepository.findMovieById(movieId);
  }
}
