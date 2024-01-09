import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  CustomTextField(
      {super.key,
      required this.labelText,
      this.errorMessage,
      required this.controller,
      required this.validator,
      this.isPassword = false,
      this.height,
      this.borderRadius,
      this.maxLines = 1,
      this.enabled = true,
      this.onTap});

  String? errorMessage;
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final bool isPassword;
  final double? height;
  final double? borderRadius;
  final int? maxLines;
  final bool enabled;
  final void Function()? onTap;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 70.h,
      child: TextFormField(
        onTap: widget.onTap,
        enabled: widget.enabled,
        controller: widget.controller,
        maxLines: widget.maxLines,
        decoration: InputDecoration(
            helperText: "",
            border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(widget.borderRadius ?? 8.r)),
            labelText: widget.labelText,
            hintText: widget.labelText,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _passwordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  )
                : null,
            errorText: widget.errorMessage),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.validator,
        obscureText: widget.isPassword && _passwordVisible,
      ),
    );
  }
}
