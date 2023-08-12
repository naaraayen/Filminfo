import 'package:equatable/equatable.dart';

import '../../data/models/actor_model.dart';

class MovieEntity extends Equatable {
  final String? id;
  final String? title;
  final int? releaseDate;
  final String? imageUrl;
  final int? runningTime;
  final dynamic genre;
  final List<ActorModel>? casts;
  const MovieEntity({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.imageUrl,
    required this.runningTime,
    required this.genre,
    required this.casts,
  });

  @override
  List<Object?> get props => [id, title, casts];
}
