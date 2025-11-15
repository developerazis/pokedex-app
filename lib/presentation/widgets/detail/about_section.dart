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
          return SingleChildScrollView(
            padding: EdgeInsets.all(24.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _InfoRow(label: 'Species', value: state.species.genus),
                _InfoRow(label: 'Height', value: '${pokemon.height / 10} m'),
                _InfoRow(label: 'Weight', value: '${pokemon.weight / 10} kg'),
                _InfoRow(
                  label: 'Abilities',
                  value: pokemon.abilities.map((e) => e.titleCase()).join(', '),
                ),
                const SizedBox(height: 20),
                const Text('Breeding',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                _InfoRow(label: 'Gender', value: state.species.genderRatio),
                _InfoRow(label: 'Egg Groups', value: state.species.eggGroups?.join(', ') ?? "-",
                ),
                _InfoRow(label: 'Egg Cycle', value: state.species.eggCycle),
              ],
            ),
          );
        } else if (state is SpeciesError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
