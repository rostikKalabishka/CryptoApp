// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../bloc/crypto_coin_details_bloc.dart';
import 'drop_down_menu.dart';

class CryptoCalculator extends StatefulWidget {
  const CryptoCalculator({
    Key? key,
    required this.symbol,
    required this.image,
    this.func,
    // this.dropdownValueFunc,
    required this.list,
    required this.price,
    required this.blocDetails,
    required this.coinCountController,
    required this.currencyController,
  }) : super(key: key);

  final String symbol;
  final String image;
  // final CurrentPrice currentPrice;
  final Function(String text)? func;
  // final Function(String text)? dropdownValueFunc;
  final List<String> list;
  final double price;
  final CryptoCoinDetailsBloc blocDetails;
  final TextEditingController coinCountController;
  final TextEditingController currencyController;

  @override
  State<CryptoCalculator> createState() => _CryptoCalculatorState();
}

class _CryptoCalculatorState extends State<CryptoCalculator> {
  @override
  // void didChangeDependencies() {
  //   coinCountController = TextEditingController(text: '1.0');
  //   currencyController = TextEditingController(
  //       text: (num.parse(coinCountController.text) * widget.price).toString());
  //   super.didChangeDependencies();
  // }

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
                    // onChanged: () {},
                    controller: widget.coinCountController,
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
                      widget.image,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(widget.symbol.toUpperCase()),
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
                    // onChanged: widget.func,
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
                  func:
                      //  (dropdownValue) =>
                      //     widget.dropdownValueFunc!(dropdownValue),
                      (dropdownValue) {
                    widget.blocDetails.add(CryptoCoinCurrencySelectedEvent(
                        selectedCurrency: dropdownValue));
                  },
                  blocDetails: widget.blocDetails,
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
