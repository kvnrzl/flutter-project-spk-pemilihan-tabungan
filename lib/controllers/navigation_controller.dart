import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  static NavigationController instance = Get.find();
  final GlobalKey<NavigatorState> navigationKey = GlobalKey();

  Future<void> navigateTo(String routeName) {
    return navigationKey.currentState!.pushNamed(routeName);
  }

  void goBack() => navigationKey.currentState!.pop();

  // Future<void> navigateToAndRemoveUntil(String routeName) {
  //   return navigationKey.currentState!.pushNamedAndRemoveUntil(
  //     routeName,
  //     (route) => false,
  //   );
  // }
}
