import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButtonAuth extends StatelessWidget {
  const CustomButtonAuth(
      {super.key, required this.image, required this.function});
  final String image;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: function,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: theme.cardColor),
        child: Center(child: SvgPicture.asset(image)),
      ),
    );
  }
}
