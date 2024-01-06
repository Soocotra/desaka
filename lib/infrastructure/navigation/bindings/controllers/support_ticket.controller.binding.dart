import 'package:get/get.dart';

import '../../../../presentation/activity/support_ticket/controllers/support_ticket.controller.dart';

class SupportTicketControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupportTicketController>(
      () => SupportTicketController(),
    );
  }
}
