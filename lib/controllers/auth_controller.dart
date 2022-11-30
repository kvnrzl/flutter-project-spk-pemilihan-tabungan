import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_spk_pemilihan_tabungan/services/auth_services.dart';
import 'package:get/get.dart';

import '../helpers/shared_preferences.dart';
import '../models/admin.dart';
import '../models/error.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  final _isAuthenticated = false.obs;
  final _username = "Log In".obs;
  final _jwtToken = "".obs;

  // final int _loginTime = DateTime.now().millisecondsSinceEpoch;

  // @override
  // void onInit() {
  //   super.onInit();
  //   ever(_isAuthenticated, (_) {
  //     if (isAuthenticated && timeLogin() == 0) {
  //       logout();
  //     }
  //   });
  // }

  // @override
  // void onInit() {
  //   super.onInit();
  //   setUsername = SharedPref.getString("username") ?? "Log In";
  //   setJwtToken = SharedPref.getString("jwt-token") ?? "";
  //   isAuthenticated = SharedPref.getBool("is-authenticated") ?? false;
  // }

  bool get isAuthenticated => _isAuthenticated.value;
  set isAuthenticated(bool value) => _isAuthenticated.value = value;

  String get getUsername => _username.value;
  set setUsername(String value) => _username.value = value;

  String get getJwtToken => _jwtToken.value;
  set setJwtToken(String value) => _jwtToken.value = value;

  Future<Either<Admin, ErrorResponse>> login(
    String username,
    String password,
  ) async {
    var result = await AuthServices.login(username, password);
    result.fold(
      (admin) {
        setUsername = admin.data!.username!;
        setJwtToken = admin.data!.token!;
        isAuthenticated = true;
        SharedPref.setBool("is-authenticated", true);
        SharedPref.setString("username", admin.data!.username!);
        SharedPref.setString("jwt-token", admin.data!.token!);
      },
      (error) {
        Get.snackbar(
          "Error",
          error.error!,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      },
    );
    return result;
  }

  Future<void> logout() async {
    await AuthServices.logout().then((value) {
      isAuthenticated = false;
      setUsername = "Log In";
      setJwtToken = "";
      SharedPref.setBool("is-authenticated", false);
      SharedPref.setString("username", "Log In");
      SharedPref.setString("jwt-token", "");

      // SharedPref.remove("login-time");
    });
  }

  // int timeLogin() {
  //   int today = DateTime.now().millisecondsSinceEpoch;
  //   int loginTimeHoursLater = DateTime.fromMillisecondsSinceEpoch(_loginTime)
  //       .add(const Duration(seconds: 20))
  //       .millisecondsSinceEpoch;
  //   return today.compareTo(loginTimeHoursLater);
  // }
}
