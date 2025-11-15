import 'package:equatable/equatable.dart';

abstract class SpeciesEvent extends Equatable {
  const SpeciesEvent();

  @override
  List<Object> get props => [];
}

class FetchSpecies extends SpeciesEvent {
  final int id;

  const FetchSpecies(this.id);

  @override
  List<Object> get props => [id];
}
