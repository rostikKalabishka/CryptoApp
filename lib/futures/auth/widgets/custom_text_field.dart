// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.textEditingController,
    required this.textInputType,
    required this.obscureText,
    required this.hintText,
  }) : super(key: key);
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final bool obscureText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      obscureText: obscureText,
      keyboardType: textInputType,
      controller: textEditingController,
      style: theme.textTheme.bodySmall,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
