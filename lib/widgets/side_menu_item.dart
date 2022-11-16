import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/helpers/responsiveness.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/widgets/vertical_menu_item.dart';

import 'horizontal_menu_item.dart';

class SideMenuItem extends StatelessWidget {
  final String itemName;
  final Function() onTap;
  const SideMenuItem({super.key, required this.itemName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isCustomSize(context)
        ? VerticalMenuItem(itemName: itemName, onTap: onTap)
        : HorizontalMenuItem(itemName: itemName, onTap: onTap);
  }
}
