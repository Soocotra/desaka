import 'package:desaka/domain/shared/usecases/date_conversion.dart';
import 'package:desaka/presentation/activity/widgets/fab.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../domain/core/constant/string.constants.dart';
import '../../shared/widgets/custom_text_field.dart';
import 'controllers/add_meeting.controller.dart';

class AddMeetingScreen extends GetView<AddMeetingController> {
  const AddMeetingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Strings.ADD_MEETING,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold)),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Form(
              key: controller.formKey,
              onChanged: controller.validating,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    controller: controller.titleController,
                    labelText: Strings.TITLE_INPUT_LABEL,
                    validator: controller.validateTitle,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomTextField(
                    controller: controller.descriptionController,
                    labelText: Strings.DESCRIPTION_INPUT_LABEL,
                    validator: controller.validateDescription,
                    height: 100.h,
                    maxLines: 5,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: controller.startController.value,
                          labelText: Strings.START_DATETIME_INPUT_LABEL,
                          validator: (_) => null,
                          onTap: () => controller.pickStartDate(),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: Obx(() => CustomTextField(
                              controller: controller.endController,
                              labelText: Strings.END_DATETIME_INPUT_LABEL,
                              validator: (value) => null,
                              onTap: () => controller.pickEndDate(),
                              enabled: controller.isStartTimePassed.value,
                            )),
                      ),
                    ],
                  ),
                  Obx(() => controller.errMessageTime.value != ''
                      ? Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(6.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: Theme.of(context)
                                  .colorScheme
                                  .error
                                  .withOpacity(0.9)),
                          child: Text(
                            controller.errMessageTime.value,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                          ),
                        )
                      : Visibility(
                          visible: controller.isTimeValidatePassed.value,
                          child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.r),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.9)),
                              child: Text(
                                '${Strings.DATETIME_SCHEDULE_SUCCESS}${controller.startSchedule.value.getHoursFormat()} ${DateFormat.yMMMd().format(controller.startSchedule.value)}',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary),
                              )),
                        )),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextField(
                    controller: controller.locationController,
                    labelText: Strings.LOCATION_INPUT_LABEL,
                    validator: controller.validateLocation,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    Strings.MEETING_WITH_INPUT_LABEL,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: GestureDetector(
                      onTap: () => controller.goToSubstitue(),
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(16.w),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                radius: 22.r,
                                child: Icon(
                                  Icons.person,
                                  size: 23.r,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Strings.ADD_SUBSTITUTE,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(Strings.ADD_DESIGNATION,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .outline)),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.add,
                                color: Theme.of(context).colorScheme.primary,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      elevation: 0,
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        padding: EdgeInsets.all(16.w),
                        radius: Radius.circular(12.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image,
                              size: 25.r,
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            const Text('Add Attachment')
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 86.h,
                  )
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
            height: 40.h,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomFAB(
                onPressed: () => controller.submitForm(),
                label: Strings.ADD_MEETING_BUTTON_LABEL)));
  }
}
