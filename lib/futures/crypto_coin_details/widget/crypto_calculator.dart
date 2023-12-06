// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crypto_app/repository/crypto_coin/models/crypto_coin_details.dart'
    show CryptoCoinDetails;
import 'package:flutter/material.dart';

import '../bloc/crypto_coin_details_bloc.dart';
import 'drop_down_menu.dart';

class CryptoCalculator extends StatefulWidget {
  const CryptoCalculator({
    Key? key,
    this.func,
    // this.dropdownValueFunc,
    required this.coin,
    required this.list,
    required this.price,
    required this.blocDetails,
    // required this.coinCountController,
    // required this.currencyController,
  }) : super(key: key);

  final CryptoCoinDetails coin;

  // final CurrentPrice currentPrice;
  final Function(String text)? func;
  // final Function(String text)? dropdownValueFunc;
  final List<String> list;
  final String price;
  final CryptoCoinDetailsBloc blocDetails;
  // TextEditingController coinCountController;
  // TextEditingController currencyController;

  @override
  State<CryptoCalculator> createState() => _CryptoCalculatorState();
}

class _CryptoCalculatorState extends State<CryptoCalculator> {
  late final TextEditingController coinCountController;
  late final TextEditingController currencyController;
  @override
  void initState() {
    widget.blocDetails.currencyPrice = widget.price;
    coinCountController =
        TextEditingController(text: widget.blocDetails.numberCoins);
    currencyController = TextEditingController(
        text: (num.parse(coinCountController.text) *
                (double.parse(widget.blocDetails.currencyPrice)))
            .toString());

    widget.blocDetails.add(CryptoCoinSaveValueInTextFieldEvent(
        saveValue: coinCountController.text));
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    onChanged: (text) {
                      var numberCoins = widget.blocDetails.numberCoins = text;
                      widget.blocDetails.add(
                          CryptoCoinSaveValueInTextFieldEvent(
                              saveValue: numberCoins));
                      currencyController.text =
                          widget.blocDetails.currencyPrice;
                    },
                    controller: coinCountController,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    onChanged: (text) {
                      widget.blocDetails.currencyPrice = text;
                      widget.blocDetails.add(
                          CryptoCoinConvertCoinToCurrencyEvent(text: text));
                      coinCountController.text = widget.blocDetails.numberCoins;
                      setState(() {});
                    },
                    controller: currencyController,
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
                  func:
                      //  (dropdownValue) =>
                      //     widget.dropdownValueFunc!(dropdownValue),
                      (dropdownValue) {
                    widget.blocDetails.add(CryptoCoinCurrencySelectedEvent(
                        selectedCurrency: dropdownValue));
                  },
                  // blocDetails: widget.blocDetails,
                  list: widget.list,
                  // currentPrice: widget.currentPrice,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
