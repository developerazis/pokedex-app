import 'package:pokeapp/domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  const PokemonModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.types,
    required super.gifUrl,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    final List<String> types = (json['types'] as List)
        .map((type) => type['type']['name'] as String)
        .toList();

    return PokemonModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['sprites']?['front_default'] ?? '',
      gifUrl: json['sprites']?['other']?['showdown']?['front_default'] ?? '',
      types: types,
    );
  }

  PokemonEntity toEntity() {
    return PokemonEntity(
      id: id,
      name: name,
      imageUrl: imageUrl,
      types: types,
      gifUrl: gifUrl,
    );
  }
}
