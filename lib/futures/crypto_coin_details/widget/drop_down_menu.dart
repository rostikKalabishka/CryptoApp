import 'package:flutter/material.dart';

import '../../../repository/crypto_coin/models/crypto_coin_details.dart';

class DropdownButtonMenu extends StatefulWidget {
  const DropdownButtonMenu({
    Key? key,
    required this.currentPrice,
  }) : super(key: key);
  final CurrentPrice currentPrice;
  @override
  State<DropdownButtonMenu> createState() => _DropdownButtonMenuState();
}

class _DropdownButtonMenuState extends State<DropdownButtonMenu> {
  late List<String> list;
  late String dropdownValue;
  @override
  void initState() {
    super.initState();
    list = widget.currentPrice
        .toJson()
        .keys
        .toList()
        .reversed
        .map((e) => e.toString())
        .toList();

    dropdownValue = list.isNotEmpty ? list.first : '';
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value.toUpperCase()),
        );
      }).toList(),
    );
  }
}
