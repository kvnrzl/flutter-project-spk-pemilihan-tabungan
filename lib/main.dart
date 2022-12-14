import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/constants/style.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/controllers/auth_controller.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/layout.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/pages/authentication/login_page.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/routing/routes.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controllers/alternative_controller.dart';
import 'controllers/menu_controller.dart';
import 'controllers/navigation_controller.dart';

void main() {
  Get.put(MenuController());
  Get.put(NavigationController());
  Get.put(AuthController());
  Get.put(AlternativeController());
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
      // routes: {
      //   '/': (context) => SiteLayout(),
      //   '/home': (context) => const HomePage(),
      //   '/alternative': (context) => const AlternativePage(),
      //   '/recomendation': (context) => const RecomendationPage(),
      // },
      // home: '/',
      getPages: [
        GetPage(name: rootRoute, page: () => SiteLayout()),
        GetPage(name: loginRoute, page: () => const LoginPage()),
      ],
      initialRoute: rootRoute,
    );
  }
}
