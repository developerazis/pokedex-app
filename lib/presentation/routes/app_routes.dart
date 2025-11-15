import 'package:flutter/material.dart';
import 'package:pokeapp/domain/entities/pokemon_entity.dart';
import 'package:pokeapp/presentation/pages/detail_page.dart';
import 'package:pokeapp/presentation/pages/home_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String detail = '/detail';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(title: 'Pokedex'),
        );
      case detail:
        final pokemon = settings.arguments as PokemonEntity;
        return MaterialPageRoute(
          builder: (_) => DetailPage(pokemon: pokemon),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
