import 'package:dio/dio.dart';
import 'package:pokeapp/data/datasources/remote/pokemon_remote_data_source.dart';
import 'package:pokeapp/data/models/pokemon_model.dart';

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
}
