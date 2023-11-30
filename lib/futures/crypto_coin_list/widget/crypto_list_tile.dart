import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/router/router.dart';
import 'package:flutter/material.dart';

import '../../../repository/crypto_coin/models/model.dart';

class CryptoListTile extends StatelessWidget {
  const CryptoListTile({
    Key? key,
    required this.coin,
  }) : super(key: key);
  final CryptoCoin coin;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      onTap: () {
        AutoRouter.of(context).push(CryptoCoinDetailsRoute(coin: coin));
      },
      leading: SizedBox(
        width: MediaQuery.of(context).size.width * 0.1,
        child: Center(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 5 / 3,
                child: Image.network(
                  coin.image,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.0345,
                child: Text('${coin.symbol.toUpperCase()} '),
              ),
            ],
          ),
        ),
      ),
      title: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.25,
            child: Text(
              '\$${coin.currentPrice}',
              textAlign: TextAlign.end,
              style: theme.textTheme.bodyMedium,
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.11,
            child: Text(
              '${coin.priceChangePercentage24h.toStringAsFixed(1)} %',
              style: theme.textTheme.bodyMedium?.copyWith(
                  color: coin.priceChangePercentage24h < 0
                      ? Colors.red
                      : Colors.green),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.34,
            child: Text(
              '\$${coin.marketCap}',
              textAlign: TextAlign.end,
              style: theme.textTheme.bodyMedium,
            ),
          )
        ],
      ),
    );
  }
}
