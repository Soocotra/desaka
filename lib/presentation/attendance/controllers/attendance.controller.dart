// ignore_for_file: non_constant_identifier_names

import 'dart:async';

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
    ever(longPressed, (callback) => callback == 1 ? checkIn() : null);
    change(null, status: RxStatus.success());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
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

  void onReleaseButton() {
    timer?.cancel();
    longPressed.value = 0;
  }

  void checkIn() async {
    change(null, status: RxStatus.loading());
    timer?.cancel();
    await Get.showSnackbar(GetSnackBar(
      title: 'Absen Berhasil',
      message: 'sukses',
      duration: Duration(milliseconds: 2000),
    )).future;
    longPressed.value = 0;
    change(null, status: RxStatus.success());
  }
}
