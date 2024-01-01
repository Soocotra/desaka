// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:desaka/domain/core/constant/enum.dart';
import 'package:desaka/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AttendanceController extends GetxController
    with StateMixin, GetSingleTickerProviderStateMixin {
  late final TabController tabController;
  final RxBool isOffice = false.obs;
  final RxString date =
      DateFormat('EEEE, MMMM d, y').format(DateTime.now()).obs;
  final RxDouble longPressed = 0.0.obs;
  final RxString checkOutTime = ''.obs;
  final RxString checkInTime = ''.obs;
  final RxString workingHrs = ''.obs;
  final attStatus = AttendanceStatus.checkIn.obs;

  Timer? timer;

  final List<Tab> myTabs = <Tab>[
    Tab(
      child: Row(
        children: [
          const Icon(Icons.home),
          SizedBox(
            width: 3.w,
          ),
          const Text('Home')
        ],
      ),
    ),
    Tab(
      child: Row(
        children: [
          const Icon(Icons.apartment),
          SizedBox(
            width: 3.w,
          ),
          const Text('Office'),
        ],
      ),
    ),
  ];
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    ever(longPressed, (callback) => callback == 1 ? onCompleteHold() : null);
    change(null, status: RxStatus.success());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void back() => Get.back();

  void refreshLocation() {}

  void changeRemoteMode(value) => isOffice.value = value == 1;
  void holdButton() {
    timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (longPressed.value < (99.1 / 100)) {
        longPressed.value += (0.9 / 100);
      } else {
        longPressed.value = 1;
      }
    });
  }

  void onCancelHold() {
    timer?.cancel();
    longPressed.value = 0;
  }

  void onCompleteHold() async {
    timer?.cancel();
    longPressed.value = 0;
    attStatusListener();
    Get.showSnackbar(const GetSnackBar(
      title: 'Absen Berhasil',
      message: 'sukses',
      duration: Duration(milliseconds: 2000),
    ));
  }

  void checkIn() =>
      checkInTime.value = DateFormat('hh:mm a').format(DateTime.now());
  void checkOut() =>
      checkOutTime.value = DateFormat('hh:mm a').format(DateTime.now());

  void attStatusListener() {
    if (attStatus.value == AttendanceStatus.checkIn) {
      checkIn();
      attStatus.value = AttendanceStatus.checkOut;
    } else if (attStatus.value == AttendanceStatus.checkOut) {
      checkOut();
      onCompleteAttendance();
      attStatus.value = AttendanceStatus.complete;
    } else if (attStatus.value == AttendanceStatus.complete) {}
  }

  void onCompleteAttendance() {
    final startHour = DateFormat('hh:mm a').parse(checkInTime.value);
    final endHour = DateFormat('hh:mm a').parse(checkOutTime.value);

    final dif = endHour.difference(startHour);

    workingHrs.value = "${dif.inMinutes ~/ 60} Hr's:${dif.inMinutes % 60} min";
  }
}
