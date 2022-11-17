import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/pages/alternative/alternative_page.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/pages/home/home_page.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/routing/routes.dart';

import '../pages/preset/preset_page.dart';
import '../pages/recomendation/recomendation_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homePageRoute:
      return _getPageRoute(const HomePage());
    case alternativePageRoute:
      return _getPageRoute(const AlternativePage());
    case recomendationPageRoute:
      return _getPageRoute(const RecomendationPage());
    case presetPageRoute:
      return _getPageRoute(const PresetPage());
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

_getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
