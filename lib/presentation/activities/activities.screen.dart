import 'package:desaka/presentation/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'controllers/activities.controller.dart';

class ActivitiesScreen extends GetView<ActivitiesController> {
  const ActivitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: const [
                0.70,
                100
              ],
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.onPrimaryContainer,
              ]),
        ),
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        width: MediaQuery.of(context).size.width,
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Add Appointments',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
                const Spacer(),
                Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimary)
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
          title: Text(
            controller.activityType.value,
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
          
        ],
      ),
    );
  }
}
