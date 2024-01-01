import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../auth/login/controllers/auth_login.controller.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {super.key,
      required this.labelText,
      this.errorMessage,
      required this.controller,
      required this.validator,
      this.isPassword = false});

  String? errorMessage;
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final bool isPassword;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.labelText,
          hintText: widget.labelText,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _passwordVisible ? Icons.visibility_off : Icons.visibility,
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
    );
  }
}
