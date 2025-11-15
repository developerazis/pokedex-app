import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokeapp/core/utils/string_extension.dart';
import 'package:pokeapp/domain/entities/pokemon_entity.dart';
import 'package:pokeapp/presentation/widgets/detail/type_chip.dart';

class PokemonDetailHeader extends StatelessWidget {
  final PokemonEntity pokemon;
  final Orientation orientation;

  const PokemonDetailHeader({super.key, required this.pokemon, this.orientation = Orientation.portrait,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderContent(pokemon),
          SizedBox(height: 8.h),
          Row(
            children: pokemon.types.map((type) => TypeChip(type: type, orientation: orientation,)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderContent(PokemonEntity pokemon) {
    if (orientation == Orientation.landscape) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _titleContent(name: pokemon.name, id: pokemon.id.toString(), orientation: Orientation.landscape),
      ) ;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _titleContent(
        name: pokemon.name,
        id: pokemon.id.toString(),
        orientation: orientation,
      ),
    );
  }

  List<Widget> _titleContent({required String name, required String id, required Orientation orientation}) {
    double nameSize = 32.sp;
    double idSize = 18.sp;
    if (orientation == Orientation.landscape) {
      nameSize = 18.sp;
      idSize = 10.sp;
    }
    return [
      Flexible(
        child: Text(
          pokemon.name.titleCase(),
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: nameSize,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
      ),
      Text(
        '#${pokemon.id.toString().padLeft(3, '0')}',
        style: TextStyle(
            fontSize: idSize,
            color: Colors.white,
            fontWeight: FontWeight.bold),
      ),
    ];
  }
}
