import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/activities.controller.dart';

class SupportTicketView extends GetView<ActivitiesController> {
  const SupportTicketView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
          'SupportTicketView is working',
          style: TextStyle(fontSize: 20),
        ),
      );
  }
}
