import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/constants/style.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/layout.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/pages/alternative/alternative_page.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/pages/home/home_page.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/pages/recomendation/recomendation_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controllers/menu_controller.dart';
import 'controllers/navigation_controller.dart';

void main() {
  Get.put(MenuController());
  Get.put(NavigationController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SPK Pemilihan Tabungan',
      theme: ThemeData(
        scaffoldBackgroundColor: light,
        textTheme: GoogleFonts.mulishTextTheme().apply(
          bodyColor: Colors.black,
        ),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()
        }),
        primaryColor: Colors.blue,
        // primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SiteLayout(),
        '/home': (context) => const HomePage(),
        '/alternative': (context) => const AlternativePage(),
        '/recomendation': (context) => const RecomendationPage(),
        // '/result': (context) => const ResultPage(),
      },
      // home: '/',
      initialRoute: '/',
    );
  }
}
