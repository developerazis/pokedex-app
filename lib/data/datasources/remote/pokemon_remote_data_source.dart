import 'package:pokeapp/data/models/evolution_chain_model.dart';
import 'package:pokeapp/data/models/pokemon_model.dart';
import 'package:pokeapp/data/models/pokemon_species_model.dart';

abstract class PokemonRemoteDataSource {
  Future<PokemonModel> getPokemon({required int id});
  Future<PokemonModel> getPokemonByName({required String name});
  Future<PokemonSpeciesModel> getPokemonSpecies({required int id});
  Future<EvolutionChainModel> getEvolutionChain({required int id});
}
