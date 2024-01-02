import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/activities.controller.dart';

class ActivitiesScreen extends GetView<ActivitiesController> {
  const ActivitiesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ActivitiesScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ActivitiesScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
