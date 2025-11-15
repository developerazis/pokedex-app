import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapp/domain/usecases/get_evolution_chain_usecase.dart';
import 'package:pokeapp/domain/usecases/get_pokemon_by_names_usecase.dart';
import 'package:pokeapp/presentation/bloc/evolution_event.dart';
import 'package:pokeapp/presentation/bloc/evolution_state.dart';

class EvolutionBloc extends Bloc<EvolutionEvent, EvolutionState> {
  final GetEvolutionChainUseCase getEvolutionChain;
  final GetPokemonByNamesUseCase getPokemonByNames;

  EvolutionBloc(this.getEvolutionChain, this.getPokemonByNames)
      : super(EvolutionInitial()) {
    on<FetchEvolution>((event, emit) async {
      emit(EvolutionLoading());
      try {
        final evolutionChain = await getEvolutionChain(id: event.id);

        final evolutions =
            await getPokemonByNames(names: evolutionChain.chain);

        emit(EvolutionLoaded(evolutions));
      } catch (e) {
        emit(const EvolutionError('Failed to fetch evolution chain'));
      }
    });
  }
}
