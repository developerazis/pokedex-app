import 'package:equatable/equatable.dart';
import 'package:pokeapp/domain/entities/pokemon_entity.dart';

abstract class HomeState extends Equatable {
  final List<PokemonEntity> pokemons;

  const HomeState({this.pokemons = const []});

  @override
  List<Object> get props => [pokemons];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {
  const HomeLoading({super.pokemons});
}

class HomeLoaded extends HomeState {
  const HomeLoaded(List<PokemonEntity> pokemons) : super(pokemons: pokemons);
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message, {super.pokemons});

  @override
  List<Object> get props => [message, pokemons];
}
