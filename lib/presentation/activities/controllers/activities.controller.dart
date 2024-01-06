// ignore_for_file: unnecessary_overrides

import 'package:desaka/domain/activities/providers/appointment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

import '../../../domain/activities/activity.dart';
import '../../../domain/activities/usecases/activity_type.dart';

class ActivitiesController extends GetxController
    with StateMixin<Activity>, GetTickerProviderStateMixin {
  final RxString activityType = ActivityScreenType.appointments.obs;

  // Common Use
  final RxString filterDate = DateFormat.yMMMM().format(DateTime.now()).obs;
  late final Widget body;
  late Activity model;
  //

  // Visit screen stuff
  late final TabController tabController;
  //

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    getParams();
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

  void getParams() {
    final activityScreenType = ActivityScreenType();
    activityScreenType.param = Get.parameters['type'] ?? '';

    activityType.value = activityScreenType.getCurrentType();
    body = activityScreenType.bodyPage;
    model = activityScreenType.getModel();
    change(model, status: RxStatus.success());
  }

  void getModel() {
    model = Activity(appointment: AppointmentProvider().getDummy());
  }

  void openDatePicker() async {
    final pickedDate = await showDatePicker(
        initialDatePickerMode: DatePickerMode.year,
        context: Get.context!,
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 50));
    filterDate.value = DateFormat.yMMMM()
        .format(pickedDate ?? DateFormat.yMMMM().parse(filterDate.value));
  }

  void prevMonth() {
    filterDate.value = Jiffy.parse(filterDate.value, pattern: 'yMMMM')
        .subtract(months: 1)
        .yMMMM;
  }

  void nextMonth() {
    filterDate.value =
        Jiffy.parse(filterDate.value, pattern: 'yMMMM').add(months: 1).yMMMM;
  }

  List<Widget> visitTabs() {
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
}
