import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../widgets/visit_card.dart';
import '../../../presentation/shared/widgets/custom_button.dart';
import '../../../presentation/shared/widgets/custom_tab_bar.dart';
import 'controllers/visit.controller.dart';

class VisitScreen extends GetView<VisitController> {
  const VisitScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            title: Text(
              'Visit',
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
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTabBar(
                  tabs: controller.getTabs(),
                  tabController: controller.tabController,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                  child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                            height: 5.h,
                          ),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) => VisitCard(
                            date:
                                DateFormat.yMMMMEEEEd().format(DateTime.now()),
                            title: 'This is a title card $index',
                          )),
                )
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          height: 40.h,
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomButton(
              text: '+ Add Appointments',
              onPressed: () => controller.goToCreateScreen()),
        ));
  }
}
