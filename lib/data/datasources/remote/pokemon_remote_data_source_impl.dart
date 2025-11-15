import 'package:dio/dio.dart';
import 'package:pokeapp/data/datasources/remote/pokemon_remote_data_source.dart';
import 'package:pokeapp/data/models/evolution_chain_model.dart';
import 'package:pokeapp/data/models/pokemon_model.dart';
import 'package:pokeapp/data/models/pokemon_species_model.dart';

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final Dio dio;

  PokemonRemoteDataSourceImpl({required this.dio});

  @override
  Future<PokemonModel> getPokemon({required int id}) async {
    try {
      final response = await dio.get('pokemon/$id');
      return PokemonModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch pokemon');
    }
  }

  @override
  Future<PokemonModel> getPokemonByName({required String name}) async {
    try {
      final response = await dio.get('pokemon/$name');
      return PokemonModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch pokemon');
    }
  }

  @override
  Future<PokemonSpeciesModel> getPokemonSpecies({required int id}) async {
    try {
      final response = await dio.get('pokemon-species/$id');
      return PokemonSpeciesModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch pokemon species');
    }
  }

  @override
  Future<EvolutionChainModel> getEvolutionChain({required int id}) async {
    try {
      final speciesResponse = await dio.get('pokemon-species/$id');
      final evolutionChainUrl = speciesResponse.data['evolution_chain']['url'];
      final evolutionChainResponse = await dio.get(evolutionChainUrl);
      return EvolutionChainModel.fromJson(evolutionChainResponse.data);
    } catch (e) {
      throw Exception('Failed to fetch evolution chain');
    }
  }
}
