// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:crypto_app/repository/abstract_coin_repository.dart';
import 'package:crypto_app/futures/crypto_coin_details/bloc/crypto_coin_details_bloc.dart';
import 'package:crypto_app/repository/crypto_coin/models/crypto_coin_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get_it/get_it.dart';

import '../../../repository/crypto_coin/models/model.dart';
// import '../bloc/crypto_coin_details_bloc.dart';

class CardDateWidget extends StatelessWidget {
  const CardDateWidget({
    Key? key,
    required this.coinDetails,
    required this.siteName,
  }) : super(key: key);

  final CryptoCoinDetails coinDetails;
  final String siteName;

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
          const Divider(
            color: Colors.white,
          ),
          RowInCard(
            text: 'Price Change 24h',
            textInfo: '\$${coinDetails.marketData.priceChange24h}',
          ),
          const Divider(
            color: Colors.white,
          ),
          RowInCard(
            text: 'Market Cap',
            textInfo: '\$${coinDetails.marketData.marketCap.usd}',
          ),
          const Divider(
            color: Colors.white,
          ),
          RowInCard(
            onTap: () {
              context
                  .read<CryptoCoinDetailsBloc>()
                  .add(CryptoCoinOpenURL(url: coinDetails.links.homepage[0]));
            },
            text: 'Home Page',
            textInfo: siteName,
          ),
          const Divider(
            color: Colors.white,
          ),
          coinDetails.links.reposUrl.github.isNotEmpty
              ? RowInCard(
                  onTap: () {
                    context.read<CryptoCoinDetailsBloc>().add(CryptoCoinOpenURL(
                        url: coinDetails.links.reposUrl.github[0]));
                  },
                  text: 'GitHub',
                  textInfo: 'github',
                )
              : const SizedBox.shrink(),
          coinDetails.links.reposUrl.github.isNotEmpty
              ? const Divider(
                  color: Colors.white,
                )
              : const SizedBox.shrink(),
          RowInCard(
            text: 'Max Supply',
            textInfo: '${coinDetails.marketData.maxSupply ?? '?'}',
          ),
          const Divider(
            color: Colors.white,
          ),
          RowInCard(
            text: 'Total Supply',
            textInfo: '${coinDetails.marketData.totalSupply ?? '?'}',
          ),
          const Divider(
            color: Colors.white,
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
    this.onTap,
    required this.text,
    required this.textInfo,
  }) : super(key: key);
  final String text;
  final String textInfo;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: theme.textTheme.displaySmall,
        ),
        Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: Text(textInfo,
                style: theme.textTheme.displaySmall,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.end),
          ),
        ),
      ],
    );
  }
}
