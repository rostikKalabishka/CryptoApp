import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../repository/abstract_coin_repository.dart';

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
  void initState() {
    super.initState();
    setup(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('biba'),
    );
  }

  void setup(id) async {
    await GetIt.I<AbstractCoinRepository>().getCryptoCoinDetails(id: id);
  }
}
