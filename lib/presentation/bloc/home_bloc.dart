import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapp/domain/usecases/get_pokemons_usecase.dart';
import 'package:pokeapp/presentation/bloc/home_event.dart';
import 'package:pokeapp/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetPokemonsUseCase getPokemons;
  int _lastId = 1;
  final int _limit = 12;

  // you cab change the last page number
  final int _lastPage = 100;
  bool _isFetching = false;

  HomeBloc(this.getPokemons) : super(HomeInitial()) {
    on<FetchPokemons>((event, emit) async {
      if (_isFetching || _lastId > _lastPage) return;

      _isFetching = true;
      emit(HomeLoading(pokemons: state.pokemons));

      try {
        final newPokemons = await getPokemons(startId: _lastId, limit: _limit);
        _lastId += _limit;
        emit(HomeLoaded(List.from(state.pokemons)..addAll(newPokemons)));
      } catch (e) {
        emit(HomeError('Failed to fetch pokemons', pokemons: state.pokemons));
      }

      _isFetching = false;
    });
  }
}
