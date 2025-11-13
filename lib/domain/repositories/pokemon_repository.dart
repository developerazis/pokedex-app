import 'package:pokeapp/domain/entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<PokemonEntity> getPokemon({required int id});
  Future<List<PokemonEntity>> getPokemons({required int startId, int limit = 20});
}
