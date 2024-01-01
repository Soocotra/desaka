import 'package:get/get.dart';

import '../../../../presentation/attendance/controllers/attendance.controller.dart';

class AttendanceControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttendanceController>(
      () => AttendanceController(),
    );
  }
}
