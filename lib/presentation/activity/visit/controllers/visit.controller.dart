import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../domain/activities/visit_model.dart';
import '../../../../infrastructure/navigation/routes.dart';

class VisitController extends GetxController
    with StateMixin<List<Visit>>, GetTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void back() {
    Get.back();
  }

  List<Widget> getTabs() {
    return [
      Tab(
        child: Row(
          children: [
            const Icon(Icons.connecting_airports_outlined),
            SizedBox(
              width: 3.w,
            ),
            const Text('My Visit')
          ],
        ),
      ),
      Tab(
        child: Row(
          children: [
            const Icon(Icons.history_toggle_off),
            SizedBox(
              width: 3.w,
            ),
            const Text('History'),
          ],
        ),
      ),
    ];
  }

  void goToCreateScreen() async {
    await Get.toNamed(Routes.ADD_VISIT)
        ?.then((value) => state?.add(value))
        .catchError((err) {
      Get.snackbar('error', err.toString());
    });
    change(state, status: RxStatus.success());
  }
}
