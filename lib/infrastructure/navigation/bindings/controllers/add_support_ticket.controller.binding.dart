import 'package:get/get.dart';

import '../../../../presentation/create_activity/add_support_ticket/controllers/add_support_ticket.controller.dart';

class AddSupportTicketControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddSupportTicketController>(
      () => AddSupportTicketController(),
    );
  }
}
