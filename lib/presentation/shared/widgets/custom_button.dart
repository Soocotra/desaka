import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.loading = false,
      this.enabled = true});

  final String text;
  final void Function() onPressed;
  final bool loading;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(8.r))),
      onPressed: enabled ? onPressed : () {},
      child: Ink(
        decoration: BoxDecoration(
          gradient: enabled
              ? LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: const [
                      0.70,
                      100
                    ],
                  colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.onPrimaryContainer,
                    ])
              : null,
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
        ),
        child: Container(
          constraints: const BoxConstraints(minWidth: 88.0, minHeight: 48),
          // min sizes for Material buttons
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              loading
                  ? SizedBox(
                      width: 16.w,
                      height: 16.w,
                      child: CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ))
                  : const SizedBox(),
              SizedBox(
                width: 16.w,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: enabled
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.outline),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
