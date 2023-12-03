import 'package:crypto_app/repository/crypto_coin/models/crypto_coin_details.dart'
    show CurrentPrice;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../repository/abstract_coin_repository.dart';
import '../bloc/crypto_coin_details_bloc.dart';
import 'drop_down_menu.dart';

class CryptoCalculator extends StatefulWidget {
  const CryptoCalculator({
    Key? key,
    required this.symbol,
    required this.image,
    required this.currentPrice,
    required this.price,
    required this.blocDetails,
  }) : super(key: key);

  final String symbol;
  final String image;
  final CurrentPrice currentPrice;
  final double price;
  final CryptoCoinDetailsBloc blocDetails;

  @override
  State<CryptoCalculator> createState() => _CryptoCalculatorState();
}

class _CryptoCalculatorState extends State<CryptoCalculator> {
  late final TextEditingController coinCountController;
  late final TextEditingController currencyController;

  @override
  void didChangeDependencies() {
    coinCountController = TextEditingController(text: '1.0');
    currencyController = TextEditingController(
        text: (num.parse(coinCountController.text) * widget.price).toString());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final _blocDetails =
    //     CryptoCoinDetailsBloc(GetIt.I<AbstractCoinRepository>());
    return BlocBuilder<CryptoCoinDetailsBloc, CryptoCoinDetailsState>(
      bloc: widget.blocDetails,
      builder: (context, state) {
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
                        onChanged: (text) {
                          widget.blocDetails
                              .add(CryptoCoinConvertCoinToCurrencyEvent(
                            text: text,
                          ));
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
                      currentPrice: widget.currentPrice,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
