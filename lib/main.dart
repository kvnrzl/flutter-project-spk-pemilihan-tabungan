import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/layout.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/pages/alternative/alternative_page.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/pages/home/home_page.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/pages/recomendation/recomendation_page.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/pages/recomendation/result_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SiteLayout(),
        '/home': (context) => const HomePage(),
        'alternative': (context) => const AlternativePage(),
        '/recomendation': (context) => const RecomendationPage(),
        '/result': (context) => const ResultPage(),
      },
      // home: '/',
      initialRoute: '/',
    );
  }
}
