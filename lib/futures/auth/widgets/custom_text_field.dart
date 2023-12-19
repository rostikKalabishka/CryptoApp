import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.textEditingController,
      required this.textInputType,
      required this.obscureText,
      required this.hintText,
      this.validator,
      this.onChange,
      this.suffixIcon,
      this.errorMsg})
      : super(key: key);
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final bool obscureText;
  final String hintText;
  final Widget? suffixIcon;
  final String? errorMsg;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChange;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      onChanged: onChange,
      validator: validator,
      obscureText: obscureText,
      keyboardType: textInputType,
      controller: textEditingController,
      style: theme.textTheme.bodySmall,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        errorText: errorMsg,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
