import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButtonAuth extends StatelessWidget {
  const CustomButtonAuth(
      {super.key,
      required this.image,
      required this.function,
      required this.text});
  final String image;
  final VoidCallback function;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: function,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: theme.cardColor),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              height: 25,
            ),
            const SizedBox(
              width: 7,
            ),
            Text(text,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ))
          ],
        )),
      ),
    );
  }
}
