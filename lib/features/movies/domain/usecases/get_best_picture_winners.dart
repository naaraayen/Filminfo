import '../entities/movie_entity.dart';
import '../repositories/movie_repository.dart';

class GetBestPictureWinnersUsecase {
  final MovieRepository movieRepository;
  GetBestPictureWinnersUsecase({required this.movieRepository});

  Future<List<MovieEntity>> call() {
    return movieRepository.getBestPictureWinners();
  }
}
