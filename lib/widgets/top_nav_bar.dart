import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/constants/controller.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/widgets/custom_text.dart';
import 'package:get/get.dart';

import '../constants/style.dart';
import '../helpers/responsiveness.dart';
import '../routing/routes.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Image.asset(
                    logoPath,
                    width: 28,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                key.currentState!.openDrawer();
              }),
      title: Obx(
        () => Row(
          children: [
            Visibility(
              visible: !ResponsiveWidget.isSmallScreen(context),
              child: CustomText(
                text: "SPK TABUNGAN",
                color: lightGrey,
                size: 20,
                weight: FontWeight.bold,
              ),
            ),
            Expanded(child: Container()),
            // IconButton(
            //   icon: Icon(
            //     Icons.settings,
            //     color: dark,
            //   ),
            //   onPressed: () {},
            // ),
            // Stack(
            //   children: [
            //     IconButton(
            //       icon: Icon(
            //         Icons.notifications,
            //         color: dark.withOpacity(.7),
            //       ),
            //       onPressed: () {},
            //     ),
            //     Positioned(
            //       top: 7,
            //       right: 7,
            //       child: Container(
            //         width: 12,
            //         height: 12,
            //         padding: const EdgeInsets.all(4),
            //         decoration: BoxDecoration(
            //             color: active,
            //             borderRadius: BorderRadius.circular(30),
            //             border: Border.all(color: light, width: 2)),
            //       ),
            //     )
            //   ],
            // ),
            Container(
              width: 1,
              height: 22,
              color: lightGrey,
            ),
            InkWell(
              onTap: () async {
                if (authController.isAuthenticated) {
                  Get.defaultDialog(
                    title: "Konfirmasi",
                    middleText: "Apakah anda yakin ingin logout?",
                    textConfirm: "Ya",
                    textCancel: "Tidak",
                    confirmTextColor: Colors.white,
                    cancelTextColor: Colors.blue,
                    buttonColor: Colors.blue,
                    onCancel: () {
                      Get.back();
                    },
                    onConfirm: () async {
                      await authController.logout().then((_) {
                        Get.back();
                        Get.snackbar("Success", "Anda berhasil logout",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.green,
                            colorText: Colors.white);
                      });
                    },
                  );
                } else {
                  Get.offAllNamed(loginRoute);
                }
              },
              child: Row(
                children: [
                  const SizedBox(
                    width: 24,
                  ),
                  CustomText(
                    text: authController.getUsername,
                    color: lightGrey,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: active.withOpacity(.5),
                        borderRadius: BorderRadius.circular(30)),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.all(2),
                      margin: const EdgeInsets.all(2),
                      child: CircleAvatar(
                        backgroundColor: light,
                        child: Icon(
                          Icons.person_outline,
                          color: dark,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      iconTheme: IconThemeData(color: dark),
      elevation: 0,
      backgroundColor: light,
    );
