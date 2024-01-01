import 'package:desaka/infrastructure/navigation/routes.dart';
import 'package:desaka/presentation/landing/widgets/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../domain/core/constant/image.constants.dart';
import 'controllers/landing.controller.dart';

class LandingScreen extends GetView<LandingController> {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: SizedBox(
        width: 64.w,
        height: 64.w,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Theme.of(context).colorScheme.secondary,
          shape: const CircleBorder(),
          child: const ImageIcon(
            AssetImage(Images.LOGO),
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildCustomBottomNavbar(context, controller),
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: Routes.HOME,
        onGenerateRoute: controller.onGenerateRoute,
      ),
    );
  }
}
