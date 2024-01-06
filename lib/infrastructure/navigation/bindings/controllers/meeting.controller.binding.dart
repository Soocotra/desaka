import 'package:get/get.dart';

import '../../../../presentation/activity/meeting/controllers/meeting.controller.dart';

class MeetingControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MeetingController>(
      () => MeetingController(),
    );
  }
}
