import 'package:desaka/presentation/auth/login/widgets/welcome_login.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            OutlinedButton(onPressed: () => {controller.increment()}, child:Text("tes")
            )
          ],
        ));
  }
}

