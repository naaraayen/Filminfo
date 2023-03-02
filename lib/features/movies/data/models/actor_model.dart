import 'dart:convert';

import '../../domain/entities/actor_entity.dart';

class ActorModel extends ActorEntity {
  const ActorModel(
      {required String id, required String name, required String category})
      : super(id: id, name: name, category: category);

        Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
    };
  }

  factory ActorModel.fromMap(Map<String, dynamic> map) {
    return ActorModel(
      id: map['id'],
      name: map['name'],
      category: map['category'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ActorModel.fromJson(String source) => ActorModel.fromMap(json.decode(source));

}
