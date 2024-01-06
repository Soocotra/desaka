import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/support_ticket.controller.dart';

class SupportTicketScreen extends GetView<SupportTicketController> {
  const SupportTicketScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SupportTicketScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SupportTicketScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
