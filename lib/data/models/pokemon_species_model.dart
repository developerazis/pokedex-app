import 'package:pokeapp/core/utils/string_extension.dart';
import 'package:pokeapp/domain/entities/pokemon_species_entity.dart';

class PokemonSpeciesModel extends PokemonSpeciesEntity {
  const PokemonSpeciesModel({
    required super.description,
    required super.genus,
    super.genderRate,
    super.eggGroups,
    super.hatchCounter,
    super.evolutionChainUrl,
  });

  factory PokemonSpeciesModel.fromJson(Map<String, dynamic> json) {
    // Find the first English flavor text entry
    final description = (json['flavor_text_entries'] as List)
        .firstWhere((entry) => entry['language']['name'] == 'en', orElse: () => {'flavor_text': ''})['flavor_text']
        .replaceAll('\n', ' ');

    // Find the English genus entry
    final genus = (json['genera'] as List)
        .firstWhere((entry) => entry['language']['name'] == 'en', orElse: () => {'genus': ''})['genus'];

    final genderRate = json['gender_rate'];

    final eggGroups = (json['egg_groups'] as List?)
        ?.map((eggGroup) => (eggGroup['name'] as String).titleCase()).toList();

    final hatchCounter = json['hatch_counter'];

    final evolutionChainUrl = json['evolution_chain']['url'];

    return PokemonSpeciesModel(
      description: description,
      genus: genus,
      genderRate: genderRate,
      eggGroups: eggGroups,
      hatchCounter: hatchCounter,
      evolutionChainUrl: evolutionChainUrl,
    );
  }
}
