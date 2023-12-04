import 'package:flutter/material.dart';

import '../bloc/crypto_coin_details_bloc.dart';

class DropdownButtonMenu extends StatefulWidget {
  const DropdownButtonMenu({
    Key? key,
    required this.list,
    required this.blocDetails,
    required this.func,
  }) : super(key: key);
  final List<String> list;
  final CryptoCoinDetailsBloc blocDetails;
  final Function(String value) func;

  @override
  State<DropdownButtonMenu> createState() => _DropdownButtonMenuState();
}

class _DropdownButtonMenuState extends State<DropdownButtonMenu> {
  late String dropdownValue = widget.list.isNotEmpty ? widget.list.first : '';

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
          widget.func(dropdownValue);
          // widget.blocDetails.add(
          //     CryptoCoinCurrencySelectedEvent(selectedCurrency: dropdownValue));
        });
      },
      items: widget.list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value.toUpperCase()),
        );
      }).toList(),
    );
  }
}
