import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../domain/shared/usecases/bottom_sheet_type.dart';

class CustomBottomSheet {
  final BottomSheetType type;
  final bool isScrollControlled;
  final bool persistent;

  CustomBottomSheet(
      {required this.type,
      this.isScrollControlled = false,
      this.persistent = true});

  void openFormBottomSheet() async {
    await Get.bottomSheet(
      Container(
        padding: EdgeInsets.only(
            top: MediaQueryData.fromView(View.of(Get.context!)).padding.top),
        color: Colors.transparent,
        child: Column(
          children: [
            Container(
              height: 7.h,
              width: 150.w,
              decoration: BoxDecoration(
                  color: Theme.of(Get.context!)
                      .colorScheme
                      .onPrimary
                      .withOpacity(0.8),
                  borderRadius: BorderRadius.circular(12.r)),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                    color: Theme.of(Get.context!).colorScheme.onPrimary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r),
                    )),
                child: type.content,
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: isScrollControlled,
    );
  }
}
