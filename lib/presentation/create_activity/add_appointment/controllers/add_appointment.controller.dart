import 'dart:async';

import 'package:desaka/domain/activities/usecases/date_conversion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/activities/usecases/validate_time_range.dart';

class AddAppointmentController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();
  final startController = TextEditingController().obs;
  final endController = TextEditingController();
  final startSchedule = DateTime.now().obs;
  final endSchedule = DateTime.now().obs;
  final now = DateTime.now().obs;
  final RxString errMessageTime = ''.obs;
  final RxBool isStartTimePassed = false.obs;
  final RxBool isEndTimePassed = false.obs;
  final RxBool isTimeValidatePassed = false.obs;
  @override
  void onInit() {
    super.onInit();
    _listenToEndSchedule();
    _listenToNowTime();
    _generateErrMessage();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      now.value = DateTime.now();
      final double combineNowTime = now.value.hour + (now.value.minute / 60.0);
      final double combineStartTime =
          startSchedule.value.hour + (startSchedule.value.minute / 60.0);
      if (combineStartTime < combineNowTime) {
        isStartTimePassed.value = false;
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void pickStartDate() async {
    final pickedDate = await showDatePicker(
        context: Get.context!,
        firstDate: DateTime.now(),
        lastDate: DateTime(startSchedule.value.year + 100));
    if (pickedDate != null) {
      final pickedTime = await showTimePicker(
          context: Get.context!,
          initialTime: TimeOfDay(
              hour: DateTime.now().hour, minute: DateTime.now().second));
      if (pickedTime != null) {
        startSchedule.value = DateTime(pickedDate.year, pickedDate.month,
            pickedDate.day, pickedTime.hour, pickedTime.minute);
      }
    }
  }

  void pickEndDate() async {
    final pickedDate = await showDatePicker(
        context: Get.context!,
        firstDate: startSchedule.value,
        lastDate: DateTime(startSchedule.value.year + 100));
    if (pickedDate != null) {
      final pickedTime = await showTimePicker(
          context: Get.context!,
          initialTime: TimeOfDay(
              hour: startSchedule.value.hour,
              minute: startSchedule.value.minute));
      if (pickedTime != null) {
        endSchedule.value = DateTime(pickedDate.year, pickedDate.month,
            pickedDate.day, pickedTime.hour, pickedTime.minute);
      }
    }
  }

  void _listenToEndSchedule() {
    ever(endSchedule, (callback) {
      final double combineStartTime =
          startSchedule.value.hour + (startSchedule.value.minute / 60.0);
      final double combineEndTime = callback.hour + (callback.minute / 60.0);
      if (combineStartTime > combineEndTime) {
        isEndTimePassed.value = false;
      } else {
        endController.text = endSchedule.value.getHoursFormat();
        isEndTimePassed.value = true;
      }
      timeRangeValidate();
    });
  }

  void _listenToNowTime() {
    ever(startSchedule, (callback) {
      now.value = DateTime.now();
      final double combineNowTime = now.value.hour + (now.value.minute / 60.0);
      final double combineStartTime =
          startSchedule.value.hour + (startSchedule.value.minute / 60.0);
      if (combineStartTime > combineNowTime) {
        startController.value.text = startSchedule.value.getHoursFormat();
        isStartTimePassed.value = true;
      }
    });
  }

  void _generateErrMessage() {
    everAll([isStartTimePassed, isEndTimePassed], (callback) {
      if (!isStartTimePassed.value) {
        errMessageTime.value = 'Harap isi jam mulai di depan jam saat ini';
      } else if (!isEndTimePassed.value) {
        errMessageTime.value = 'Harap isi jam berakhir di depan jam mulai';
      } else if (isStartTimePassed.value && isEndTimePassed.value) {
        errMessageTime.value = '';
      }
    });
  }

  void timeRangeValidate() {
    isTimeValidatePassed.value = isStartTimePassed.value &&
        isEndTimePassed.value &&
        errMessageTime.value == '' &&
        (startController.value.text != '' && endController.value.text != '');
    print(startController.value.text);
    print(endController.value.text);
  }
}
