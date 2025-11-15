import 'package:pokeapp/domain/entities/evolution_chain_entity.dart';
import 'package:pokeapp/domain/entities/pokemon_entity.dart';

class PokemonEvolutionEntity {
  final EvolutionChainEntity evolutionChain;
  final List<PokemonEntity> pokemons;

  PokemonEvolutionEntity({
    required this.evolutionChain,
    required this.pokemons,
  });
}
