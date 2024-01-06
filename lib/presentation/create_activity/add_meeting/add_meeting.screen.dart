import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/add_meeting.controller.dart';

class AddMeetingScreen extends GetView<AddMeetingController> {
  const AddMeetingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddMeetingScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddMeetingScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
