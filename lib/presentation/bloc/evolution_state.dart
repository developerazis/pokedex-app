import 'package:equatable/equatable.dart';
import 'package:pokeapp/domain/entities/pokemon_entity.dart';

abstract class EvolutionState extends Equatable {
  const EvolutionState();

  @override
  List<Object> get props => [];
}

class EvolutionInitial extends EvolutionState {}

class EvolutionLoading extends EvolutionState {}

class EvolutionLoaded extends EvolutionState {
  final List<PokemonEntity> evolutions;

  const EvolutionLoaded(this.evolutions);

  @override
  List<Object> get props => [evolutions];
}

class EvolutionError extends EvolutionState {
  final String message;

  const EvolutionError(this.message);

  @override
  List<Object> get props => [message];
}
