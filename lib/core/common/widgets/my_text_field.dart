import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final bool enable;
  final String? prefixIcon;
  final String? initialValue;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? helperText;
  final String? errorText;
  final TextInputType keyboardType;
  final ValueChanged<String> onChanged;
  const CustomTextField(
      {super.key,
      this.initialValue,
      this.errorText,
       this.helperText,
      required this.hintText,
      required this.obscureText,
      required this.enable,
      this.prefixIcon,
      required this.keyboardType,
      required this.onChanged,
       this.focusNode, this.controller});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      onChanged: widget.onChanged,
      textInputAction: TextInputAction.next,
      obscureText: widget.obscureText,
      enabled: widget.enable,
      decoration: InputDecoration(
        hintText: widget.hintText,
        helperText: widget.helperText,
        errorText: widget.errorText,
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
}
