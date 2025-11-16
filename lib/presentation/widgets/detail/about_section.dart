import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokeapp/core/utils/string_extension.dart';
import 'package:pokeapp/domain/entities/pokemon_entity.dart';
import 'package:pokeapp/presentation/bloc/species_bloc.dart';
import 'package:pokeapp/presentation/bloc/species_state.dart';
import 'package:pokeapp/presentation/widgets/detail/info_row.dart';

class AboutSection extends StatelessWidget {
  final PokemonEntity pokemon;

  const AboutSection({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpeciesBloc, SpeciesState>(
      builder: (context, state) {
        if (state is SpeciesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SpeciesLoaded) {
          return OrientationBuilder(builder: (context, orientation) {
            final isPortrait = orientation == Orientation.portrait;
            return SingleChildScrollView(
              padding: EdgeInsets.all(24.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoRow(label: 'Species', value: state.species.genus),
                  InfoRow(label: 'Height', value: '${pokemon.height / 10} m'),
                  InfoRow(label: 'Weight', value: '${pokemon.weight / 10} kg'),
                  InfoRow(
                      label: 'Abilities',
                      value: pokemon.abilities.map((e) => e.titleCase()).join(', ')),
                  SizedBox(height: 20.h),
                  Text('Breeding',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: isPortrait ? 16.sp : 12.sp)),
                  const InfoRow(
                      label: 'Gender', value: 'Male: 87.5%, Female: 12.5%'),
                  const InfoRow(label: 'Egg Groups', value: 'Monster'),
                  const InfoRow(label: 'Egg Cycle', value: 'Grass'),
                ],
              ),
            );
          });
        } else if (state is SpeciesError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }
}
