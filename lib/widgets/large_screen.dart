import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/widgets/side_menu.dart';

import '../helpers/local_navigator.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: SideMenu(),
        ),
        Expanded(
          flex: 5,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: localNavigator(),
          ),
        )
      ],
    );
  }
}
