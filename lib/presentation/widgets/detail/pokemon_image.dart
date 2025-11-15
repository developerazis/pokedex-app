import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokeapp/domain/entities/pokemon_entity.dart';

class PokemonImage extends StatelessWidget {
  final PokemonEntity pokemon;

  const PokemonImage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: Image.network(
        pokemon.imageUrl,
        fit: BoxFit.contain,
      ),
    );
  }
}
