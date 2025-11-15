import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokeapp/core/utils/elemen_color_mapper.dart';
import 'package:pokeapp/core/utils/string_extension.dart';
import 'package:pokeapp/domain/entities/pokemon_entity.dart';
import 'package:pokeapp/presentation/bloc/evolution_bloc.dart';
import 'package:pokeapp/presentation/bloc/evolution_state.dart';

class EvolutionSection extends StatelessWidget {
  final PokemonEntity pokemon;

  const EvolutionSection({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EvolutionBloc, EvolutionState>(
      builder: (context, state) {
        if (state is EvolutionLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is EvolutionLoaded) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(24.r),
            child: Row(
              children: List.generate(state.evolutions.length, (index) {
                final evolution = state.evolutions[index];
                final isLast = index == state.evolutions.length - 1;
                return Row(
                  children: [
                    _EvolutionCard(
                      pokemon: evolution,
                      isActive: evolution.name == pokemon.name,
                    ),
                    if (!isLast)
                      const Icon(Icons.arrow_forward, color: Colors.grey),
                  ],
                );
              }),
            ),
          );
        } else if (state is EvolutionError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }
}

class _EvolutionCard extends StatelessWidget {
  final PokemonEntity pokemon;
  final bool isActive;

  const _EvolutionCard({required this.pokemon, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: setBackgroundColor(pokemon.types.first),
      elevation: isActive ? 4 : 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              pokemon.imageUrl,
              width: isActive ? 100.w : 80.w,
              height: isActive ? 100.h : 80.h,
            ),
            Text(pokemon.name.titleCase(), style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
