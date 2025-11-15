import 'package:pokeapp/domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  const PokemonModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.gifUrl,
    required super.types,
    required super.height,
    required super.weight,
    required super.abilities,
    required super.hp,
    required super.attack,
    required super.defense,
    required super.specialAttack,
    required super.specialDefense,
    required super.speed,
    required super.moves,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    final List<String> types = (json['types'] as List)
        .map((type) => type['type']['name'] as String)
        .toList();

    final List<String> abilities = (json['abilities'] as List)
        .map((ability) => ability['ability']['name'] as String)
        .toList();

    final stats = json['stats'] as List;

    int getStat(String name) {
      try {
        return stats.firstWhere((stat) => stat['stat']['name'] == name)['base_stat'];
      } catch (e) {
        return 0;
      }
    }

    final List<String> moves = (json['moves'] as List)
        .map((move) => move['move']['name'] as String)
        .toList();

    return PokemonModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['sprites']?['other']?['official-artwork']?['front_default'] ??
          json['sprites']?['front_default'] ??
          '',
      gifUrl: json['sprites']?['other']?['showdown']?['front_default'] ?? '',
      types: types,
      height: json['height'],
      weight: json['weight'],
      abilities: abilities,
      hp: getStat('hp'),
      attack: getStat('attack'),
      defense: getStat('defense'),
      specialAttack: getStat('special-attack'),
      specialDefense: getStat('special-defense'),
      speed: getStat('speed'),
      moves: moves,
    );
  }

  PokemonEntity toEntity() {
    return PokemonEntity(
      id: id,
      name: name,
      imageUrl: imageUrl,
      gifUrl: gifUrl,
      types: types,
      height: height,
      weight: weight,
      abilities: abilities,
      hp: hp,
      attack: attack,
      defense: defense,
      specialAttack: specialAttack,
      specialDefense: specialDefense,
      speed: speed,
      moves: moves,
    );
  }
}
