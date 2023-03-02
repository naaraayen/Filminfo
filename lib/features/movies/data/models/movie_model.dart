import 'dart:convert';

import '../../domain/entities/movie_entity.dart';
import 'actor_model.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    String? id,
    String? title,
    int? releaseDate,
    String? imageUrl,
    int? runningTime,
    List<dynamic>? genre,
    List<ActorModel>? casts,
  }) : super(
          id: id,
          title: title,
          releaseDate: releaseDate,
          imageUrl: imageUrl,
          runningTime: runningTime,
          genre: genre,
          casts: casts,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'releaseDate': releaseDate,
      'casts': casts?.map((x) => x.toMap()).toList(),
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['title']['id'] ?? '',
      title: map['title']['title'] ?? '',
      releaseDate: map['title']['year'] ?? '',
      imageUrl: map['title']['image']['url'] ?? '',
      runningTime: map['title']['runningTimeInMinutes'] ?? '',
      genre: map['genres'] ?? '',
      casts: (map['casts'] != null
              ? List<ActorModel>.from(
                  map['casts']?.map((x) => ActorModel.fromMap(x)))
              : null) ??
          [],
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));
}