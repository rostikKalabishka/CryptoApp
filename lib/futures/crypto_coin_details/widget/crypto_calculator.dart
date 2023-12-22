// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crypto_app/repository/crypto_coin/models/crypto_coin_details.dart'
    show CryptoCoinDetails;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/crypto_coin_details_bloc.dart';
import 'drop_down_menu.dart';

class CryptoCalculator extends StatefulWidget {
  const CryptoCalculator({
    Key? key,
    // this.dropdownValueFunc,
    required this.coin,

    // required this.cryptoCoinSaveValueInTextField,
    // required this.cryptoCoinConvertCoinToCurrency,
    required this.dropDownList,
    required this.price,
    required this.blocDetails,
    required this.coinCountController,
    required this.currencyController,
  }) : super(key: key);

  final CryptoCoinDetails coin;
  // final Function(String text) cryptoCoinSaveValueInTextField;

  // final CurrentPrice currentPrice;
  // final Function(String text) cryptoCoinConvertCoinToCurrency;
  // final Function(String text)? dropdownValueFunc;
  final List<String> dropDownList;
  final String price;
  final CryptoCoinDetailsBloc blocDetails;

  // final String currencyPrice;
  final TextEditingController coinCountController;
  final TextEditingController currencyController;

  @override
  State<CryptoCalculator> createState() => _CryptoCalculatorState();
}

class _CryptoCalculatorState extends State<CryptoCalculator> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Card(
          color: theme.cardColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    onChanged: (text) {
                      BlocProvider.of<CryptoCoinDetailsBloc>(context).add(
                          CryptoCoinSaveValueInTextFieldEvent(
                              saveValue: text,
                              coinCountTwo: widget.currencyController.text));
                    },
                    controller: widget.coinCountController,
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      fillColor: theme.cardColor,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
              Container(
                width: 1,
                height: MediaQuery.of(context).size.height * 0.03,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.network(
                      widget.coin.image.small,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(widget.coin.symbol.toUpperCase()),
                  ],
                ),
              ),
            ],
          ),
        ),
        Card(
          color: theme.cardColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    onChanged: (text) {
                      BlocProvider.of<CryptoCoinDetailsBloc>(context).add(
                          CryptoCoinConvertCoinToCurrencyEvent(
                              coinCount: widget.coinCountController.text,
                              price: widget.currencyController.text));
                    },
                    controller: widget.currencyController,
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 8),
                    ),
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
              Container(
                width: 1,
                height: MediaQuery.of(context).size.height * 0.03,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DropdownButtonMenu(
                  dropDownList: widget.dropDownList,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
