import 'package:equatable/equatable.dart';

class ActorEntity extends Equatable {
  final String? id;
  final String? name;
  final String? category;
  const ActorEntity({
    required this.id,
    required this.name,
    required this.category,
  });

  @override
  List<Object?> get props => [id, name, category];
}
