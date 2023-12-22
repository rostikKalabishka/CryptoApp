import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/crypto_coin_details_bloc.dart';

class DropdownButtonMenu extends StatefulWidget {
  const DropdownButtonMenu({
    Key? key,
    required this.dropDownList,
  }) : super(key: key);
  final List<String> dropDownList;

  @override
  State<DropdownButtonMenu> createState() => _DropdownButtonMenuState();
}

class _DropdownButtonMenuState extends State<DropdownButtonMenu> {
  late String dropdownValue =
      widget.dropDownList.isNotEmpty ? widget.dropDownList.first : '';

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
          BlocProvider.of<CryptoCoinDetailsBloc>(context).add(
              CryptoCoinCurrencySelectedEvent(selectedCurrency: dropdownValue));
        });
      },
      items: widget.dropDownList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value.toUpperCase()),
        );
      }).toList(),
    );
  }
}
