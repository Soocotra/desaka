import 'package:desaka/presentation/shared/widgets/CustomButton.dart';
import 'package:desaka/presentation/shared/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../domain/core/constant/string.constants.dart';
import '../controllers/auth_login.controller.dart';

class BodyLogin extends GetView<AuthLoginController> {
  const BodyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Form(
          key: controller.loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomTextField(
                  labelText: Strings.USERNAME_LABEL,
                  controller: controller.usernameController,
                  validator: controller.usernameValidator),
              SizedBox(height: 32.h),
              CustomTextField(
                labelText: Strings.PASSWORD_LABEL,
                controller: controller.passwordController,
                validator: controller.passwordValidator,
                isPassword: true,
              ),
              SizedBox(
                height: 16.h,
              ),
              InkWell(
                onTap: () => {},
                child: Text(
                  "Lupa Password?",
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.end,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Obx(() {
                return CustomButton(
                    text: Strings.LOGIN_BUTTON_TEXT,
                    onPressed: controller.login,
                    loading: controller.isLoading.value);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
