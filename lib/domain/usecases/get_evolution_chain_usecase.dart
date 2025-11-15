import 'package:pokeapp/domain/entities/evolution_chain_entity.dart';
import 'package:pokeapp/domain/repositories/pokemon_repository.dart';

class GetEvolutionChainUseCase {
  final PokemonRepository repository;

  GetEvolutionChainUseCase(this.repository);

  Future<EvolutionChainEntity> call({required int id}) {
    return repository.getEvolutionChain(id: id);
  }
}
