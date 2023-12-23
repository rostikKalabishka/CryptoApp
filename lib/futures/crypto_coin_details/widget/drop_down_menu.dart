import 'package:crypto_app/ui/theme/const.dart';
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
      dropdownColor: scaffoldBackground,
      value: dropdownValue,
      icon: const Icon(
        Icons.arrow_downward,
        color: accentColor,
      ),
      elevation: 16,
      style: const TextStyle(color: Colors.white),
      underline: Container(
        height: 2,
        color: accentColor,
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
