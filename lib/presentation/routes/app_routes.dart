import 'package:flutter/material.dart';
import 'package:pokeapp/presentation/pages/home_page.dart';

class AppRoutes {
  static const String home = '/';

  static Map<String, WidgetBuilder> get routes {
    return {
      home: (context) => const HomePage(title: 'Flutter Demo Home Page'),
    };
  }
}
