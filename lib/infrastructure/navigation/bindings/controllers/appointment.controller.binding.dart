import 'package:get/get.dart';

import '../../../../presentation/activity/appointment/controllers/appointment.controller.dart';

class AppointmentControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppointmentController>(
      () => AppointmentController(),
    );
  }
}
