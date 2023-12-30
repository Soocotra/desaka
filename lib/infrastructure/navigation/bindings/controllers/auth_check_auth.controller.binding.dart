import 'package:get/get.dart';

import '../../../../presentation/auth/check_auth/controllers/auth_check_auth.controller.dart';

class AuthCheckAuthControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthCheckAuthController>(
      () => AuthCheckAuthController(),
    );
  }
}
