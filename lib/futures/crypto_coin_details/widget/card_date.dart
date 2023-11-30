// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crypto_app/repository/crypto_coin/models/crypto_coin_details.dart';
import 'package:flutter/material.dart';

import '../../../repository/crypto_coin/models/model.dart';

class CardDateWidget extends StatelessWidget {
  const CardDateWidget({
    Key? key,
    required this.coinDetails,
    required this.coinInfoFromList,
  }) : super(key: key);

  final CryptoCoinDetails coinDetails;
  final CryptoCoin coinInfoFromList;
  @override
  Widget build(BuildContext context) {
    // final coinDetails = widget.coinDetails;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Market Cap Rank'),
              Text('#${coinDetails.marketCapRank}'),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Market Cap'),
              Text('\$${coinInfoFromList.marketCap}'),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Fully Diluted Valuation'),
              Text('\$${coinInfoFromList.fullyDilutedValuation}'),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total Volume'),
              Text('\$${coinInfoFromList.totalVolume}'),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Home Page'),
              Text(coinDetails.links.homepage[0]),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Max Supply'),
              Text('${coinDetails.marketData.maxSupply ?? '?'}'),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total Supply'),
              Text('${coinDetails.marketData.totalSupply ?? '?'}'),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Added to Watchlist'),
              Text('${coinDetails.watchlistPortfolioUsers}'),
            ],
          ),
        ]),
      ),
    );
  }
}
