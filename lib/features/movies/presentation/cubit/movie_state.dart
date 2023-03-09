part of 'movie_cubit.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class MovieFetching extends MovieState {}

class MovieFetched extends MovieState {
  final List<MovieEntity> moviesList;

  const MovieFetched(this.moviesList);
  

  MovieFetched copyWith({
    List<MovieEntity>? moviesList,
  }) {
    return MovieFetched(
      moviesList ?? this.moviesList,
    );
  }
}

class MovieFetchingError extends MovieState {}
