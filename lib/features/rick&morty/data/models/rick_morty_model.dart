import '../../domain/entity/rick_morty_entity.dart';

class RickMortyModel extends RickMortyEntity {
  const RickMortyModel(
      {final int? id,
      final String? name,
      final String? status,
      final String? species,
      final String? type,
      final String? gender,
      final String? image})
      : super(
            id: id,
            name: name,
            status: status,
            species: species,
            type: type,
            gender: gender);

  factory RickMortyModel.fromJson(Map<String, dynamic> map) {
    return RickMortyModel(
      id: map['id'] ?? "",
      name: map['name'] ?? "",
      status: map['status'] ?? "",
      species: map['species'] ?? "",
      type: map['type'] ?? "",
      gender: map['gender'] ?? "",
      image: map['image'] ?? "",
    );
  }

  factory RickMortyModel.fromEntity(RickMortyEntity entity) {
    return RickMortyModel(
      id: entity.id,
      name: entity.name,
      status: entity.status,
      species: entity.species,
      type: entity.type,
      gender: entity.gender,
      image: entity.image,
    );
  }
}
