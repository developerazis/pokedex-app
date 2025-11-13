import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pokeapp/core/network/dio_client.dart';
import 'package:pokeapp/data/datasources/remote/pokemon_remote_data_source.dart';
import 'package:pokeapp/data/datasources/remote/pokemon_remote_data_source_impl.dart';
import 'package:pokeapp/domain/entities/pokemon_entity.dart';
import 'package:pokeapp/domain/repositories/pokemon_repository.dart';

// This function will be executed in a separate isolate
Future<List<PokemonEntity>> _fetchPokemons(Map<String, int> params) async {
  final int startId = params['startId']!;
  final int limit = params['limit']!;

  // Create dependencies inside the isolate
  final dio = DioClient.instance;
  final remoteDataSource = PokemonRemoteDataSourceImpl(dio: dio);

  final futures = <Future<PokemonEntity>>[];
  for (int i = startId; i < startId + limit; i++) {
    futures.add(remoteDataSource.getPokemon(id: i).then((model) => model.toEntity()));
  }

  final pokemons = await Future.wait(futures);
  return pokemons;
}

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;

  PokemonRepositoryImpl({required this.remoteDataSource});

  @override
  Future<PokemonEntity> getPokemon({required int id}) async {
    final pokemonModel = await remoteDataSource.getPokemon(id: id);
    return pokemonModel.toEntity();
  }

  @override
  Future<List<PokemonEntity>> getPokemons({required int startId, int limit = 20}) async {
    return await compute(_fetchPokemons, {'startId': startId, 'limit': limit});
  }
}
