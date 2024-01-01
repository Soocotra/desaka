import 'package:desaka/infrastructure/navigation/bindings/controllers/controllers_bindings.dart';
import 'package:desaka/infrastructure/navigation/routes.dart';
import 'package:desaka/presentation/auth/login/auth_login.screen.dart';
import 'package:desaka/presentation/home/home.screen.dart';
import 'package:desaka/presentation/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LandingController extends GetxController {
  final pages = [
    Routes.HOME,
    Routes.AUTH_LOGIN,
    Routes.ATTENDANCE,
    Routes.AUTH_LOGIN
  ];

  final _tabIndex = 0.obs;

  get tabIndex => _tabIndex.value;

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

  void changeTabIndex(int index) {
    _tabIndex.value = index;
    Get.toNamed(pages[index], id: 1);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == Routes.HOME) {
      return GetPageRoute(
        settings: settings,
        page: () => HomeScreen(),
        binding: HomeControllerBinding(),
      );
    }

    if (settings.name == Routes.AUTH_LOGIN) {
      return GetPageRoute(
        settings: settings,
        page: () => AuthLoginScreen(),
        binding: AuthLoginControllerBinding(),
      );
    }
    if (settings.name == Routes.ATTENDANCE) {
      return GetPageRoute(
        settings: settings,
        page: () => AttendanceScreen(),
        binding: AttendanceControllerBinding(),
      );
    }

    return null;
  }
}
