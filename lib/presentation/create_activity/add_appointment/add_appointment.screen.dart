import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../shared/widgets/custom_text_field.dart';
import 'controllers/add_appointment.controller.dart';
import '../../../domain/activities/usecases/date_conversion.dart';

class AddAppointmentScreen extends GetView<AddAppointmentController> {
  const AddAppointmentScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Appointments',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold)),
          centerTitle: false,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                controller: controller.titleController,
                labelText: 'Title',
                validator: (_) => null,
                height: 50.h,
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomTextField(
                controller: controller.descriptionController,
                labelText: 'Description',
                validator: (_) => null,
                height: 100.h,
                maxLines: 5,
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: controller.startController.value,
                      labelText: 'Start',
                      validator: (_) => null,
                      onTap: () => controller.pickStartDate(),
                      height: 50.h,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Obx(() => CustomTextField(
                          controller: controller.endController,
                          labelText: 'End',
                          validator: (value) => null,
                          onTap: () => controller.pickEndDate(),
                          enabled: controller.isStartTimePassed.value,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
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
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    )
                  : Visibility(
                      visible: controller.isTimeValidatePassed.value,
                      child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(6.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.9)),
                          child: Text(
                            'Janji akan dilaksanakan pada pukul ${controller.startSchedule.value.getHoursFormat()} ${DateFormat.yMMMd().format(controller.startSchedule.value)}',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                          )),
                    ))
            ],
          ),
        ));
  }
}
