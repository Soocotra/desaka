import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/add_appointment.controller.dart';

class AddAppointmentScreen extends GetView<AddAppointmentController> {
  const AddAppointmentScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddAppointmentScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddAppointmentScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
