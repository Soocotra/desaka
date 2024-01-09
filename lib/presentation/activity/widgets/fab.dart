import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/widgets/custom_button.dart';

class CustomFAB extends StatelessWidget {
  const CustomFAB({super.key, this.enabled = false, required this.onPressed, required this.label});

  final bool enabled;
  final  void Function() onPressed;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40.h,
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomButton(
            enabled: enabled,
            text: label,
            onPressed: () => onPressed),
      );
  }
}