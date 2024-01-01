import 'dart:async';

import 'package:desaka/domain/auth/usecases/validate_password.dart';
import 'package:desaka/domain/auth/usecases/validate_username.dart';
import 'package:desaka/infrastructure/navigation/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthLoginController extends GetxController {
  //TODO: Implement AuthLoginController
  final loginFormKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  String? usernameValidator(String? value) {
    return ValidateUsername().execute(value ?? "");
  }

  String? passwordValidator(String? value) {
    return ValidatePassword().execute(value ?? "");
  }

  //simulate api
  Future<bool> checkUser(String user, String password) async {
    isLoading.value = true;

    // Simulate a 3-second delay
    await Future.delayed(Duration(seconds: 3));

    bool isValidUser = user == 'tes' && password == '123';

    isLoading.value = false;

    return isValidUser;
  }


  //TODO temporary code remove when api implemented
  void login() {
    if (loginFormKey.currentState!.validate()) {
      isLoading.value = true;
      checkUser(usernameController.text, passwordController.text).then((auth) {
        if (auth) {
          isLoading.value = false;
          Get.offNamed(Routes.LANDING);
          Get.snackbar('Login', 'Login successfully', snackPosition: SnackPosition.BOTTOM);
        } else {
          isLoading.value = false;
          Get.snackbar('Login', 'Invalid email or password', snackPosition: SnackPosition.BOTTOM);
        }
        passwordController.clear();
      });
    }
  }
}
