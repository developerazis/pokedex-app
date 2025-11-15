import 'package:pokeapp/domain/entities/evolution_chain_entity.dart';
import 'package:pokeapp/domain/entities/pokemon_entity.dart';
import 'package:pokeapp/domain/entities/pokemon_species_entity.dart';

abstract class PokemonRepository {
  Future<PokemonEntity> getPokemon({required int id});
  Future<List<PokemonEntity>> getPokemonByNames({required List<String> names});
  Future<List<PokemonEntity>> getPokemons({required int startId, int limit = 20});
  Future<PokemonSpeciesEntity> getPokemonSpecies({required int id});
  Future<EvolutionChainEntity> getEvolutionChain({required int id});
}
