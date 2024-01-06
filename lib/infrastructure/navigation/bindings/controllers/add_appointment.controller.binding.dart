import 'package:get/get.dart';

import '../../../../presentation/create_activity/add_appointment/controllers/add_appointment.controller.dart';

class AddAppointmentControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddAppointmentController>(
      () => AddAppointmentController(),
    );
  }
}
