import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'controllers/activities.controller.dart';

class ActivitiesScreen extends GetView<ActivitiesController> {
  const ActivitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
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
      body: controller.body,
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
                Obx(() => Text(
                      'Add ${controller.activityType}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),
                    )),
                const Spacer(),
                Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimary)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
