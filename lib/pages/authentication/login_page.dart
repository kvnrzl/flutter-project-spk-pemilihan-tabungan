import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/controller.dart';
import '../../constants/style.dart';
import '../../routing/routes.dart';
import '../../services/auth_services.dart';
import '../../widgets/custom_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formLoginKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Image.asset(logoPath),
                  ),
                  Expanded(child: Container()),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text("Login",
                      style: GoogleFonts.roboto(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  CustomText(
                    text: "Welcome back to the admin panel.",
                    color: lightGrey,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Form(
                key: _formLoginKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _username,
                      decoration: InputDecoration(
                        labelText: "Username",
                        hintText: "Enter username",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username cannot be empty";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _password,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () async {
                        if (_formLoginKey.currentState!.validate()) {
                          await authController
                              .login(_username.text, _password.text)
                              .then((value) {
                            authController.setUsername =
                                value.data!.username ?? "admin";
                            Get.offAllNamed(rootRoute);
                          });
                          // await AuthServices.login(
                          //   _username.text,
                          //   _password.text,
                          // ).then((value) {
                          //   if (value.code == 200) {
                          //     authController.login();
                          //     authController.setUsername =
                          //         value.data!.username ?? "Log In";
                          //     Get.offAllNamed(rootRoute);
                          //   } else {
                          //     // Get.snackbar(
                          //     //     "Error",
                          //     //     value.message ??
                          //     //         "Username atau Password salah",
                          //     //     snackPosition: SnackPosition.BOTTOM);
                          //     ScaffoldMessenger.of(context).showSnackBar(
                          //       const SnackBar(
                          //           content: Text(
                          //               'Error : Username atau Password Salah')),
                          //     );
                          //   }
                          // });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: active,
                            borderRadius: BorderRadius.circular(20)),
                        alignment: Alignment.center,
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: const CustomText(
                          text: "Login",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // const SizedBox(
              //   height: 15,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Row(
              //       children: [
              //         Checkbox(value: true, onChanged: (value) {}),
              //         const CustomText(
              //           text: "Remeber Me",
              //         ),
              //       ],
              //     ),
              //     CustomText(text: "Forgot password?", color: active)
              //   ],
              // ),

              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                    text: "Don't have an account?",
                    size: 14,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Get.offAllNamed(rootRoute);
                    },
                    child: CustomText(
                      text: "Enter as a Guest",
                      color: active,
                      size: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
