import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokeapp/core/utils/elemen_color_mapper.dart';
import 'package:pokeapp/core/utils/string_extension.dart';
import 'package:pokeapp/domain/entities/pokemon_entity.dart';

class MovesSection extends StatelessWidget {
  final PokemonEntity pokemon;

  const MovesSection({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    if (pokemon.moves.isEmpty) {
      return const Center(
        child: Text("Moves is empty"),
      );
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.h),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 2.5
        ),
        itemCount: pokemon.moves.length,
        itemBuilder: (context, index) {
          final move = pokemon.moves[index];
          return Container(
            decoration: BoxDecoration(
              color: setBackgroundColor(pokemon.types.first),
              borderRadius: BorderRadius.circular(16.r)
            ),
            child: Center(
              child: Text(move.titleCase(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
            ),
          );
        },
      ),
    );
  }
}
