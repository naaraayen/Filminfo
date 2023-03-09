import 'package:equatable/equatable.dart';

import '../../data/models/actor_model.dart';

class MovieEntity extends Equatable {
  final String? id;
  final String? title;
  final String? releaseDate;
  final String? imageUrl;
  final String? runningTime;
  final List<dynamic>? genre;
  final List<ActorModel>? casts;
  const MovieEntity({
    this.id,
    this.title,
    this.releaseDate,
    this.imageUrl,
    this.runningTime,
    this.genre,
    this.casts,
  });

  @override
  List<Object?> get props => [id, title, casts];
}
