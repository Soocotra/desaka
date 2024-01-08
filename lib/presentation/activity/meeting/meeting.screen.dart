import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../widgets/appointment_list.dart';
import '../widgets/dynamic_calendar_icon.dart';
import '../../../presentation/shared/widgets/custom_button.dart';
import 'controllers/meeting.controller.dart';
import '../../../domain/shared/usecases/date_conversion.dart';

class MeetingScreen extends GetView<MeetingController> {
  const MeetingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            title: Text(
              'Meeting',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            centerTitle: false,
            leading: IconButton(
              onPressed: () => controller.back(),
              icon: const Icon(
                Icons.arrow_back,
              ),
            )),
        body: Column(
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
            controller.obx((state) => ListView.builder(
                  shrinkWrap: true,
                  itemCount: state?.length,
                  itemBuilder: (context, index) {
                    final meeting = state?[index];
                    return GestureDetector(
                      onTap: () {},
                      child: AppointmentList(
                          title: meeting?.title ?? '',
                          leading: DynamicCalendarIcon(
                            date: meeting?.startSchedule?.getDate() ?? 0,
                            month: meeting?.startSchedule?.getMMM() ?? '',
                            height: 55.h,
                            width: 50.h,
                          ),
                          subtitle:
                              '${meeting?.startSchedule?.getHoursFormat()}, ${meeting?.startSchedule?.getMMM()}'),
                    );
                  },
                ))
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          height: 40.h,
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomButton(
              text: '+ Add Meeting',
              onPressed: () => controller.goToCreateScreen()),
        ));
  }
}
