import 'package:equatable/equatable.dart';

class EvolutionChainEntity extends Equatable {
  final List<String> chain;

  const EvolutionChainEntity({required this.chain});

  @override
  List<Object?> get props => [chain];
}
