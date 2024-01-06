import 'package:desaka/presentation/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BaseBottomSheet extends StatelessWidget {
  const BaseBottomSheet(
      {super.key,
      required this.text,
      required this.buttonText,
      required this.illustration});
  final String text;
  final String buttonText;
  final Widget illustration;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(width: 150.h, height: 150.h, child: illustration),
        Text(
          text,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        CustomButton(text: buttonText, onPressed: () => Get.back())
      ],
    );
  }
}
