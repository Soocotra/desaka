import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/activities.controller.dart';

class MeetingView extends GetView<ActivitiesController> {
  const MeetingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return 
      const Center(
        child: Text(
          'MeetingView is working',
          style: TextStyle(fontSize: 20),
        ),
      );
  }
}
