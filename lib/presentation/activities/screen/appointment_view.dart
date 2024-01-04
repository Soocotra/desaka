import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/activities.controller.dart';

class AppointmentView extends GetView<ActivitiesController> {
  const AppointmentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () => controller.prevMonth(),
                  icon: const Icon(Icons.arrow_back_ios_new)),
              InkWell(
                  onTap: () => controller.openDatePicker(),
                  borderRadius: BorderRadius.circular(6.r),
                  child: Padding(
                    padding: EdgeInsets.all(5.h),
                    child: Obx(
                      () => Text(controller.filterDate.value),
                    ),
                  )),
              IconButton(
                  onPressed: () => controller.nextMonth(),
                  icon: const Icon(Icons.arrow_forward_ios)),
            ],
          ),
        ),
      ],
    );
  }
}
