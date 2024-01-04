import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/activities.controller.dart';

class VisitView extends GetView<ActivitiesController> {
  const VisitView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  const Center(
        child: Text(
          'VisitView is working',
          style: TextStyle(fontSize: 20),
        ),
      );
  }
}
