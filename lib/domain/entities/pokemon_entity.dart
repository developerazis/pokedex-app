import 'package:equatable/equatable.dart';

class PokemonEntity extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final String gifUrl;
  final List<String> types;
  final int height;
  final int weight;
  final List<String> abilities;
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;
  final List<String> moves;

  const PokemonEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.gifUrl,
    required this.types,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
    required this.moves,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        types,
        gifUrl,
        height,
        weight,
        abilities,
        hp,
        attack,
        defense,
        specialAttack,
        specialDefense,
        speed,
        moves,
      ];
}
