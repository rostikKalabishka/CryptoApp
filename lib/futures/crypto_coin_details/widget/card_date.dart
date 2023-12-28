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
  }) : super(key: key);

  final CryptoCoinDetails coinDetails;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: theme.cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          RowInCard(
            text: 'Market Cap Rank',
            textInfo: '#${coinDetails.marketCapRank}',
          ),
          Divider(
            color: theme.dividerColor,
          ),
          RowInCard(
            text: 'Price Change 24h',
            textInfo: '\$${coinDetails.marketData.priceChange24h}',
          ),
          Divider(
            color: theme.dividerColor,
          ),
          RowInCard(
            text: 'Market Cap',
            textInfo: '\$${coinDetails.marketData.marketCap.usd}',
          ),
          Divider(
            color: theme.dividerColor,
          ),
          RowInCard(
            text: 'Home Page',
            textInfo: coinDetails.links.homepage.first,
          ),
          Divider(
            color: theme.dividerColor,
          ),
          coinDetails.links.reposUrl.github.isNotEmpty
              ? RowInCard(
                  text: 'GitHub',
                  textInfo: coinDetails.links.reposUrl.github[0],
                )
              : const SizedBox.shrink(),
          coinDetails.links.reposUrl.github.isNotEmpty
              ? Divider(
                  color: theme.dividerColor,
                )
              : const SizedBox.shrink(),
          RowInCard(
            text: 'Max Supply',
            textInfo: '${coinDetails.marketData.maxSupply ?? '?'}',
          ),
          Divider(
            color: theme.dividerColor,
          ),
          RowInCard(
            text: 'Total Supply',
            textInfo: '${coinDetails.marketData.totalSupply ?? '?'}',
          ),
          Divider(
            color: theme.dividerColor,
          ),
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
        Expanded(
          child: Text(textInfo,
              overflow: TextOverflow.ellipsis, textAlign: TextAlign.end),
        ),
      ],
    );
  }
}
