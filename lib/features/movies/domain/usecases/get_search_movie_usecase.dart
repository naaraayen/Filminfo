import '../entities/movie_entity.dart';
import '../repositories/movie_repository.dart';

class GetSearchMovieUsecase {
  final MovieRepository movieRepository;

  GetSearchMovieUsecase({required this.movieRepository});

  Future<List<MovieEntity>> call(String searchKeyword) async {
    return movieRepository.getSearchMoviesList(searchKeyword);
  }
}
