import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapp/domain/usecases/get_pokemon_species_usecase.dart';
import 'package:pokeapp/presentation/bloc/species_event.dart';
import 'package:pokeapp/presentation/bloc/species_state.dart';

class SpeciesBloc extends Bloc<SpeciesEvent, SpeciesState> {
  final GetPokemonSpeciesUseCase getPokemonSpecies;

  SpeciesBloc(this.getPokemonSpecies) : super(SpeciesInitial()) {
    on<FetchSpecies>((event, emit) async {
      emit(SpeciesLoading());
      try {
        final species = await getPokemonSpecies(id: event.id);
        emit(SpeciesLoaded(species));
      } catch (e) {
        emit(const SpeciesError('Failed to fetch pokemon species'));
      }
    });
  }
}
