import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/auth_check_auth.controller.dart';

class AuthCheckAuthScreen extends GetView<AuthCheckAuthController> {
  const AuthCheckAuthScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AuthCheckAuthScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AuthCheckAuthScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
