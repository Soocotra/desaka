import 'package:get/get.dart';

import '../../../../presentation/activity/visit/controllers/visit.controller.dart';

class VisitControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VisitController>(
      () => VisitController(),
    );
  }
}
