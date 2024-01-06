import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/add_visit.controller.dart';

class AddVisitScreen extends GetView<AddVisitController> {
  const AddVisitScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddVisitScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddVisitScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
