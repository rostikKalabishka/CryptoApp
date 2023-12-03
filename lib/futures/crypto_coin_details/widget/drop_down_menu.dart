import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../repository/abstract_coin_repository.dart';
import '../../../repository/crypto_coin/models/crypto_coin_details.dart';
import '../bloc/crypto_coin_details_bloc.dart';
// typedef

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
  final _blocDetails = CryptoCoinDetailsBloc(GetIt.I<AbstractCoinRepository>());
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
    return BlocBuilder<CryptoCoinDetailsBloc, CryptoCoinDetailsState>(
      bloc: _blocDetails,
      builder: (context, state) {
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

              _blocDetails.add(CryptoCoinCurrencySelectedEvent(
                  selectedCurrency: dropdownValue));
            });
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value.toUpperCase()),
            );
          }).toList(),
        );
      },
    );
  }
}
