import 'package:pokeapp/domain/entities/pokemon_entity.dart';
import 'package:pokeapp/domain/repositories/pokemon_repository.dart';

class GetPokemonByNamesUseCase {
  final PokemonRepository repository;

  GetPokemonByNamesUseCase(this.repository);

  Future<List<PokemonEntity>> call({required List<String> names}) {
    return repository.getPokemonByNames(names: names);
  }
}
