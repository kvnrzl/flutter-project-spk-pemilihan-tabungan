import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/helpers/responsiveness.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/widgets/large_screen.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/widgets/side_menu.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/widgets/top_nav_bar.dart';

import 'widgets/small_screen.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  SiteLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: topNavigationBar(context, _scaffoldKey),
      drawer: const Drawer(
        child: SideMenu(),
      ),
      // body: const AlternativePage(),
      body: const ResponsiveWidget(
        largeScreen: LargeScreen(),
        smallScreen: SmallScreen(),
      ),
    );
  }
}
