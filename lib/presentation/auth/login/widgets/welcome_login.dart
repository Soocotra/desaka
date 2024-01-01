import 'package:desaka/domain/core/constant/image.constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../domain/core/constant/string.constants.dart';
import '../controllers/auth_login.controller.dart';

class WelcomeLogin extends GetView<AuthLoginController> {
  const WelcomeLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                image: const DecorationImage(
                    image: AssetImage(Images.IMG_LOGIN),
                    scale: 5,
                    alignment: Alignment.bottomRight)),
            height: MediaQuery.of(context).size.height * 0.4,
          ),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 32.h,
                ),
                Text(
                  Strings.WELCOME_LOGIN_LABEL,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.white),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  Strings.TELL_TO_LOGIN,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.white),
                ),
                SizedBox(
                  height: 72.h,
                ),
                Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(8.r)),
                    child: Image(
                      image: const AssetImage(Images.LOGO),
                      height: 72.h,
                      alignment: Alignment.bottomLeft,
                    )),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
