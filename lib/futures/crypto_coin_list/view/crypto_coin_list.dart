import 'package:flutter/material.dart';

import '../../../repository/crypto_coin/crypto_coins_repository.dart';
import '../../../repository/crypto_coin/models/crypto_coin.dart';
// import '../../../repository/crypto_coin/models/crypto_coin_list.dart';

class CryptoCoinListScreen extends StatefulWidget {
  const CryptoCoinListScreen({super.key});

  @override
  State<CryptoCoinListScreen> createState() => _CryptoCoinListScreenState();
}

class _CryptoCoinListScreenState extends State<CryptoCoinListScreen> {
  final cryptoCoinsRepository = CryptoCoinsRepository();
  List<CryptoCoin> listCoin = [];
  @override
  void initState() {
    _fetchCryptoCoins();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: listCoin.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('${listCoin[index].name} '),
                      );
                    })),
          ],
        ),
      )),
    );
  }

  void _fetchCryptoCoins() async {
    listCoin = await cryptoCoinsRepository.getCryptoCoinList(
        currency: 'currency', count: 1, page: 2, locale: 'locale');
  }
}
