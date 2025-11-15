import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokeapp/core/di/injection.dart';
import 'package:pokeapp/core/utils/elemen_color_mapper.dart';
import 'package:pokeapp/domain/entities/pokemon_entity.dart';
import 'package:pokeapp/presentation/bloc/evolution_bloc.dart';
import 'package:pokeapp/presentation/bloc/evolution_event.dart';
import 'package:pokeapp/presentation/bloc/species_bloc.dart';
import 'package:pokeapp/presentation/bloc/species_event.dart';
import 'package:pokeapp/presentation/widgets/detail/pokemon_detail_header.dart';
import 'package:pokeapp/presentation/widgets/detail/pokemon_image.dart';
import 'package:pokeapp/presentation/widgets/detail/pokemon_info_card.dart';

class DetailPage extends StatelessWidget {
  final PokemonEntity pokemon;

  const DetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          getIt<SpeciesBloc>()..add(FetchSpecies(pokemon.id)),
        ),
        BlocProvider(
          create: (context) =>
          getIt<EvolutionBloc>()..add(FetchEvolution(pokemon.id)),
        ),
      ],
      child: DetailView(pokemon: pokemon),
    );
  }
}

class DetailView extends StatelessWidget {
  const DetailView({super.key, required this.pokemon,});
  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: setBackgroundColor(pokemon.types.first),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Flexible(
                flex: 2,
                child: PokemonDetailHeader(pokemon: pokemon),
              ),
              Flexible(
                flex: 3,
                child: PokemonInfoCard(pokemon: pokemon)
              )
            ],
          ),
          Positioned(
            top: 75.h,
            child: PokemonImage(pokemon: pokemon),
          ),
        ],
      )
    );
  }
}
