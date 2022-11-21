import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/widgets/side_menu_item.dart';
import 'package:get/get.dart';

import '../constants/controller.dart';
import '../constants/style.dart';
import '../helpers/responsiveness.dart';
import '../routing/routes.dart';
import 'custom_text.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: light,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(width: width / 48),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Image.asset(logoPath),
                    ),
                    Flexible(
                      child: CustomText(
                        text: "SPK TABUNGAN",
                        size: 20,
                        weight: FontWeight.bold,
                        color: active,
                      ),
                    ),
                    SizedBox(width: width / 48),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Divider(
                  color: lightGrey.withOpacity(.1),
                ),
              ],
            ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItems
                .map(
                  (item) => SideMenuItem(
                    itemName: item.name,
                    onTap: () {
                      // if (item.route == authenticationPageRoute) {
                      // Get.offAllNamed(authenticationPageRoute);
                      // menuController
                      //     .changeActiveItemTo(overviewPageDisplayName);
                      // }
                      if (item.route == presetPageRoute &&
                          authController.isAuthenticated == false) {
                        Get.snackbar("Error",
                            "Anda tidak memiliki akses untuk mengubah preset bobot kriteria",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red,
                            colorText: Colors.white);
                        return;
                      }

                      if (!menuController.isActive(item.name)) {
                        menuController.changeActiveItemTo(item.name);
                        if (ResponsiveWidget.isSmallScreen(context)) Get.back();
                        navigationController.navigateTo(item.route);
                      }
                    },
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
