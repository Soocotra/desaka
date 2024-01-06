import 'package:get/get.dart';

import '../../../../presentation/create_activity/add_meeting/controllers/add_meeting.controller.dart';

class AddMeetingControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddMeetingController>(
      () => AddMeetingController(),
    );
  }
}
