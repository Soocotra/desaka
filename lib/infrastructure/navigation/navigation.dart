import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../config.dart';
import '../../presentation/screens.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  const EnvironmentsBadge({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.AUTH_LOGIN,
      page: () => const AuthLoginScreen(),
      binding: AuthLoginControllerBinding(),
    ),
    GetPage(
      name: Routes.AUTH_CHECK_AUTH,
      page: () => const AuthCheckAuthScreen(),
      binding: AuthCheckAuthControllerBinding(),
    ),
    GetPage(
      name: Routes.LANDING,
      page: () => const LandingScreen(),
      binding: LandingControllerBinding(),
     ),
    GetPage(
      name: Routes.ATTENDANCE,
      page: () => const AttendanceScreen(),
      binding: AttendanceControllerBinding(),
     ),
  ];
}
