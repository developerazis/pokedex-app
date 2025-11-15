import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokeapp/domain/entities/pokemon_entity.dart';
import 'package:pokeapp/presentation/widgets/detail/info_row.dart';

class BaseStatsSection extends StatelessWidget {
  final PokemonEntity pokemon;

  const BaseStatsSection({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24.r),
      child: Column(
        children: [
          _StatBar(label: 'HP', value: pokemon.hp),
          _StatBar(label: 'Attack', value: pokemon.attack),
          _StatBar(label: 'Defense', value: pokemon.defense),
          _StatBar(label: 'Sp. Atk', value: pokemon.specialAttack),
          _StatBar(label: 'Sp. Def', value: pokemon.specialDefense),
          _StatBar(label: 'Speed', value: pokemon.speed),
        ],
      ),
    );
  }
}

class _StatBar extends StatelessWidget {
  final String label;
  final int value;

  const _StatBar({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        children: [
          SizedBox(
            width: 100.w,
            child: Text(
              label,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          SizedBox(
            width: 40.w,
            child: Text(
              value.toString(),
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: LinearProgressIndicator(
              value: value / 100,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(
                  value > 50 ? Colors.green : Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
