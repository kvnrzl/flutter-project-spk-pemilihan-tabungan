import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/style.dart';
import '../routing/routes.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();

  var activeItem = homePage.obs;
  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isActive(String itemName) => activeItem.value == itemName;

  isHovering(String itemName) => hoverItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case homePage:
        return _customIcon(Icons.home, itemName);
      case alternativePage:
        return _customIcon(Icons.list, itemName);
      case recomendationPage:
        return _customIcon(Icons.recommend, itemName);
      case presetPage:
        return _customIcon(Icons.settings, itemName);
      default:
        return _customIcon(Icons.error, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) return Icon(icon, color: dark, size: 22);

    return Icon(icon, color: isHovering(itemName) ? dark : lightGrey);
  }
}
