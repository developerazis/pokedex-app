import 'package:pokeapp/domain/entities/pokemon_species_entity.dart';
import 'package:pokeapp/domain/repositories/pokemon_repository.dart';

class GetPokemonSpeciesUseCase {
  final PokemonRepository repository;

  GetPokemonSpeciesUseCase(this.repository);

  Future<PokemonSpeciesEntity> call({required int id}) {
    return repository.getPokemonSpecies(id: id);
  }
}
