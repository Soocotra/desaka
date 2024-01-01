import 'package:desaka/infrastructure/navigation/bindings/controllers/controllers_bindings.dart';
import 'package:desaka/infrastructure/navigation/routes.dart';
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




  void changeTabIndex(int index) {
    _tabIndex.value = index;
    Get.toNamed(pages[index], id: 1);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == Routes.HOME) {
      return GetPageRoute(
        settings: settings,
        page: () => const HomeScreen(),
        binding: HomeControllerBinding(),
      );
    }

    if (settings.name == Routes.AUTH_LOGIN) {
      return GetPageRoute(
        settings: settings,
        page: () => const AuthLoginScreen(),
        binding: AuthLoginControllerBinding(),
      );
    }
    if (settings.name == Routes.ATTENDANCE) {
      return GetPageRoute(
        settings: settings,
        page: () => const AttendanceScreen(),
        binding: AttendanceControllerBinding(),
      );
    }

    return null;
  }
}
