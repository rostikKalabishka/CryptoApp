// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({
    Key? key,
    required this.info,
  }) : super(key: key);
  final Widget info;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: theme.cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: info,
      ),
    );
  }
}
