import 'package:desaka/presentation/auth/login/widgets/body_login.dart';
import 'package:desaka/presentation/auth/login/widgets/welcome_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'controllers/auth_login.controller.dart';

class AuthLoginScreen extends GetView<AuthLoginController> {
  const AuthLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            WelcomeLogin(),
            BodyLogin(),
          ],
        ),
      ),
    ));
  }
}
