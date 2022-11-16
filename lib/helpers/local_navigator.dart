import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/routing/router.dart';

import '../constants/controller.dart';
import '../routing/routes.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigationKey,
      initialRoute: homePage,
      onGenerateRoute: generateRoute,
    );
