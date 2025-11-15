import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokeapp/core/utils/elemen_color_mapper.dart';
import 'package:pokeapp/core/utils/string_extension.dart';
import 'package:pokeapp/domain/entities/pokemon_entity.dart';
import 'package:pokeapp/presentation/routes/app_routes.dart';

class PokemonCard extends StatelessWidget {
  final PokemonEntity pokemon;

  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final color = setBackgroundColor(pokemon.types.first);

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoutes.detail, arguments: pokemon),
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              Positioned(
                bottom: -constraints.maxHeight * 0.25,
                right: -constraints.maxWidth * 0.08,
                child: Image.asset(
                  'assets/pokemon_ball.png',
                  width: constraints.maxWidth * 0.65,
                  height: constraints.maxHeight * 1.1,
                  fit: BoxFit.contain,
                  color: Colors.white.withOpacity(0.25),
                ),
              ),
              Positioned(
                bottom: -constraints.maxHeight * 0.1,
                right: -constraints.maxWidth * 0.01,
                child: Image.network(
                  pokemon.imageUrl,
                  width: constraints.maxWidth * 0.55,
                  height: constraints.maxHeight,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pokemon.name.titleCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    ...pokemon.types.map((type) => _buildTypes(type)),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildTypes(String type) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        margin: EdgeInsets.only(bottom: 4.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: setTypeColor(type),
        ),
        child: Text(
          type.titleCase(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 10.sp,
          ),
        ),
    );
  }
}
