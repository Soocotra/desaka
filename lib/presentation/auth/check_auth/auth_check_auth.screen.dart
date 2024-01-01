import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../domain/core/constant/image.constants.dart';
import 'controllers/auth_check_auth.controller.dart';

class AuthCheckAuthScreen extends GetView<AuthCheckAuthController> {
  const AuthCheckAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() {
          final size = 180.0 - 50.0 * controller.breathe;
          return Container(
            width: size.w,
            height: size.h,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(16.r)),
            padding: EdgeInsets.all(16.w),
            child: const Image(
              image: AssetImage(Images.LOGO),
              fit: BoxFit.cover,
            ),
          );
        }),
      ),
    );
  }
}
