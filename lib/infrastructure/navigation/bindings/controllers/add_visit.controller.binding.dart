import 'package:get/get.dart';

import '../../../../presentation/create_activity/add_visit/controllers/add_visit.controller.dart';

class AddVisitControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddVisitController>(
      () => AddVisitController(),
    );
  }
}
