// ignore_for_file: unnecessary_overrides

import 'package:desaka/domain/activities/providers/appointment_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../domain/activities/appointment_model.dart';
import '../../../../infrastructure/navigation/routes.dart';

class AppointmentController extends GetxController
    with StateMixin<List<Appointment>> {
  final RxString filterDate = DateFormat.yMMMM().format(DateTime.now()).obs;
  @override
  void onInit() {
    super.onInit();
    change(AppointmentProvider().getDummy(), status: RxStatus.success());
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

  void goToCreateScreen() async {
    await Get.toNamed(Routes.ADD_APPOINTMENT)
        ?.then((value) => state?.add(value))
        .catchError((err) {});
    change(state, status: RxStatus.success());
  }
}
