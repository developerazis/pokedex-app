import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokeapp/domain/entities/pokemon_entity.dart';
import 'package:pokeapp/presentation/widgets/detail/about_section.dart';
import 'package:pokeapp/presentation/widgets/detail/base_stats_section.dart';
import 'package:pokeapp/presentation/widgets/detail/evolution_section.dart';
import 'package:pokeapp/presentation/widgets/detail/moves_section.dart';

class PokemonInfoCard extends StatelessWidget {
  final PokemonEntity pokemon;

  const PokemonInfoCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            TabBar(
              dividerColor: Colors.transparent,
              labelStyle: TextStyle(fontSize: 12.sp, fontFamily: 'Fredoka'),
              tabs: const [
                Tab(text: 'About',),
                Tab(text: 'Base Stats'),
                Tab(text: 'Evolution'),
                Tab(text: 'Moves'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  AboutSection(pokemon: pokemon),
                  BaseStatsSection(pokemon: pokemon),
                  EvolutionSection(pokemon: pokemon),
                  MovesSection(pokemon: pokemon)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
