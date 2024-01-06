import 'package:desaka/presentation/shared/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/activities.controller.dart';
import '../widgets/visit_card.dart';

class VisitView extends GetView<ActivitiesController> {
  const VisitView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTabBar(
              tabs: controller.visitTabs(),
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
                        date: DateFormat.yMMMMEEEEd().format(DateTime.now()),
                        title: 'This is a title card $index',
                      )),
            )
          ],
        ),
      ),
    );
  }
}
