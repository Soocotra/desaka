import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../shared/widgets/custom_button.dart';
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
          height: 40.h,
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomButton(
              text: '+ Add ${controller.activityType}', onPressed: () {}),
        ));
  }
}
