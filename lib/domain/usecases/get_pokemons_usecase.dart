import 'package:pokeapp/domain/entities/pokemon_entity.dart';
import 'package:pokeapp/domain/repositories/pokemon_repository.dart';

class GetPokemonsUseCase {
  final PokemonRepository repository;

  GetPokemonsUseCase(this.repository);

  Future<List<PokemonEntity>> call({required int startId, int limit = 20}) {
    return repository.getPokemons(startId: startId, limit: limit);
  }
}
