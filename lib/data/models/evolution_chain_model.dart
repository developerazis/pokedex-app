import 'package:pokeapp/domain/entities/evolution_chain_entity.dart';

class EvolutionChainModel extends EvolutionChainEntity {
  const EvolutionChainModel({required super.chain});

  factory EvolutionChainModel.fromJson(Map<String, dynamic> json) {
    List<String> chain = [];
    var current = json['chain'];
    while (current != null) {
      chain.add(current['species']['name']);
      if (current['evolves_to'] != null && current['evolves_to'].isNotEmpty) {
        current = current['evolves_to'][0];
      } else {
        current = null;
      }
    }
    return EvolutionChainModel(chain: chain);
  }
}
