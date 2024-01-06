import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/add_support_ticket.controller.dart';

class AddSupportTicketScreen extends GetView<AddSupportTicketController> {
  const AddSupportTicketScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddSupportTicketScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddSupportTicketScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
