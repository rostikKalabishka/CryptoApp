// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:crypto_app/repository/abstract_coin_repository.dart';
import 'package:crypto_app/repository/crypto_coin/models/crypto_coin_details.dart';
import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';

import '../../../repository/crypto_coin/models/model.dart';
// import '../bloc/crypto_coin_details_bloc.dart';

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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          RowInCard(
            text: 'Market Cap Rank',
            textInfo: '#${coinDetails.marketCapRank}',
          ),
          const Divider(),
          RowInCard(
            text: 'Market Cap',
            textInfo: '\$${coinInfoFromList.marketCap}',
          ),
          const Divider(),
          RowInCard(
            text: 'Fully Diluted Valuation',
            textInfo: '\$${coinInfoFromList.fullyDilutedValuation}',
          ),
          const Divider(),
          RowInCard(
            text: 'Total Volume',
            textInfo: '\$${coinInfoFromList.totalVolume}',
          ),
          const Divider(),
          RowInCard(
            text: 'Home Page',
            textInfo: coinDetails.links.homepage.first,
          ),
          const Divider(),
          RowInCard(
            text: 'Max Supply',
            textInfo: '${coinDetails.marketData.maxSupply ?? '?'}',
          ),
          const Divider(),
          RowInCard(
            text: 'Total Supply',
            textInfo: '${coinDetails.marketData.totalSupply ?? '?'}',
          ),
          const Divider(),
          RowInCard(
            text: 'Added to Watchlist',
            textInfo: '${coinDetails.watchlistPortfolioUsers}',
          )
        ]),
      ),
    );
  }
}

class RowInCard extends StatelessWidget {
  const RowInCard({
    Key? key,
    required this.text,
    required this.textInfo,
  }) : super(key: key);
  final String text;
  final String textInfo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
        Text(textInfo),
      ],
    );
  }
}
