import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CryptoCoinDetailsScreen extends StatefulWidget {
  const CryptoCoinDetailsScreen({super.key, required this.id});
  final String id;
  @override
  State<CryptoCoinDetailsScreen> createState() =>
      _CryptoCoinDetailsScreenState();
}

class _CryptoCoinDetailsScreenState extends State<CryptoCoinDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('biba'),
    );
  }
}
