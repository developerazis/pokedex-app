import 'package:equatable/equatable.dart';

abstract class EvolutionEvent extends Equatable {
  const EvolutionEvent();

  @override
  List<Object> get props => [];
}

class FetchEvolution extends EvolutionEvent {
  final int id;

  const FetchEvolution(this.id);

  @override
  List<Object> get props => [id];
}
