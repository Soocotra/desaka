import 'package:animated_icon/animated_icon.dart';
import 'package:desaka/domain/core/constant/enum.dart';
import 'package:desaka/domain/core/constant/string.constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

import 'controllers/attendance.controller.dart';

class AttendanceScreen extends GetView<AttendanceController> {
  const AttendanceScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              Strings.ATTENDANCE_LABEL,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
            centerTitle: false,
            leading: IconButton(
              onPressed: () => controller.back(),
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            )),
        body: controller.obx((state) => Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Theme.of(context).colorScheme.error,
                          size: 30.w,
                        ),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.w),
                          child: Text(
                            'P1600 Amphittheatre Pkwy Montain View 94043',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        )),
                        CircleAvatar(
                          radius: 14.r,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          child: AnimateIcon(
                            animateIcon: AnimateIcons.refresh,
                            onTap: () {},
                            iconType: IconType.animatedOnTap,
                            height: 19.h,
                            width: 19.h,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  Strings.REMOTE_CHOICE,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 64.w),
                  child: Container(
                    height: 32.h,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(30.r)),
                    child: TabBar(
                      tabAlignment: TabAlignment.center,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: Theme.of(context).colorScheme.primary,
                      tabs: controller.myTabs,
                      labelPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                      ),
                      padding: EdgeInsets.all(3.w),
                      dividerColor: Colors.transparent,
                      controller: controller.tabController,
                      labelStyle: Theme.of(context).textTheme.labelMedium,
                      unselectedLabelColor:
                          Theme.of(context).colorScheme.onPrimary,
                      indicator: BoxDecoration(
                          color: Theme.of(context).colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(30.r)),
                      indicatorColor: Theme.of(context).colorScheme.onPrimary,
                      onTap: (value) => controller.changeRemoteMode(value),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                DigitalClock(
                  is24HourTimeFormat: false,
                  hourMinuteDigitTextStyle:
                      Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Obx(() => Text(
                      controller.date.value,
                      style: Theme.of(context).textTheme.bodyLarge,
                    )),
                SizedBox(
                  height: 20.h,
                ),
                Obx(() => CircularPercentIndicator(
                      radius: 76.r,
                      progressColor: Theme.of(context).colorScheme.primary,
                      percent: controller.longPressed.value,
                      center: GestureDetector(
                        onLongPress: controller.attStatus.value ==
                                AttendanceStatus.complete
                            ? null
                            : () => controller.holdButton(),
                        onLongPressEnd: (details) => controller.onCancelHold(),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          margin: EdgeInsets.all(6.r),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: controller.attStatus.value ==
                                      AttendanceStatus.checkIn
                                  ? [
                                      Theme.of(context).colorScheme.primary,
                                      Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                    ]
                                  : controller.attStatus.value ==
                                          AttendanceStatus.checkOut
                                      ? [
                                          Theme.of(context).colorScheme.error,
                                          Theme.of(context).colorScheme.onError,
                                        ]
                                      : [
                                          Theme.of(context).colorScheme.primary,
                                          Theme.of(context).colorScheme.primary,
                                        ],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: controller.attStatus.value ==
                                    AttendanceStatus.complete
                                ? [
                                    Icon(
                                      Icons.check,
                                      size: 55.w,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                    Text(
                                      'Done',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary),
                                    )
                                  ]
                                : [
                                    Icon(
                                      Icons.touch_app_outlined,
                                      size: 55.w,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                    Text(
                                      controller.attStatus.value ==
                                              AttendanceStatus.checkIn
                                          ? Strings.CHECK_IN
                                          : Strings.CHECK_OUT,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary),
                                    )
                                  ],
                          ),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      hoursBuilder(context,
                          icon: Icons.access_time_outlined,
                          hours: controller.checkInTime.value == ''
                              ? '--:--'
                              : controller.checkInTime.value,
                          label: Strings.CHECK_IN),
                      hoursBuilder(context,
                          icon: Icons.access_time_outlined,
                          hours: controller.checkOutTime.value == ''
                              ? '--:--'
                              : controller.checkOutTime.value,
                          label: Strings.CHECK_OUT),
                      hoursBuilder(context,
                          icon: Icons.access_time_outlined,
                          hours: controller.workingHrs.value == ''
                              ? '--:--'
                              : controller.workingHrs.value,
                          label: Strings.WORKING_HRS)
                    ],
                  ),
                )
              ],
            )));
  }

  Column hoursBuilder(BuildContext context,
      {required IconData icon, required String label, required String hours}) {
    return Column(children: [
      Icon(icon, color: Theme.of(context).colorScheme.primary),
      SizedBox(
        height: 5.h,
      ),
      Text(hours, style: Theme.of(context).textTheme.bodySmall),
      SizedBox(
        height: 5.h,
      ),
      Text(label, style: Theme.of(context).textTheme.labelSmall)
    ]);
  }
}
