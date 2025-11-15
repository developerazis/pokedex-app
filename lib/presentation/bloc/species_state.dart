import 'package:equatable/equatable.dart';
import 'package:pokeapp/domain/entities/pokemon_species_entity.dart';

abstract class SpeciesState extends Equatable {
  const SpeciesState();

  @override
  List<Object> get props => [];
}

class SpeciesInitial extends SpeciesState {}

class SpeciesLoading extends SpeciesState {}

class SpeciesLoaded extends SpeciesState {
  final PokemonSpeciesEntity species;

  const SpeciesLoaded(this.species);

  @override
  List<Object> get props => [species];
}

class SpeciesError extends SpeciesState {
  final String message;

  const SpeciesError(this.message);

  @override
  List<Object> get props => [message];
}
