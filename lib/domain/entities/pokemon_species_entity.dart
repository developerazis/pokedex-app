import 'package:equatable/equatable.dart';

class PokemonSpeciesEntity extends Equatable {
  final String description;
  final String genus;
  final int? genderRate;
  final List<String>? eggGroups;
  final int? hatchCounter;
  final String? evolutionChainUrl;


  const PokemonSpeciesEntity({
    required this.description,
    required this.genus,
    this.genderRate,
    this.eggGroups,
    this.hatchCounter,
    this.evolutionChainUrl,
  });

  String get genderRatio {
    if (genderRate == null) {
      return "-";
    }
    if (genderRate == -1) {
      return "Genderless";
    }

    final femalePercentage = ((genderRate ?? 0) / 8) * 100;
    final malePercentage = 100 - femalePercentage;

    return "Male: $malePercentage%, Female: $femalePercentage%";
  }

  String get eggCycle {
    if (hatchCounter == null) {
      return "-";
    }
    final eggCycle = (hatchCounter ?? 0) * 257;
    return "$eggCycle steps";
  }

  @override
  List<Object?> get props => [
        description,
        genus,
        genderRate,
        eggGroups,
        hatchCounter,
      ];
}
