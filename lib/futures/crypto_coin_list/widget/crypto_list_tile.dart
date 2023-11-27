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
    return ListTile(
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
            child: Text('\$${coin.currentPrice}', textAlign: TextAlign.end),
          ),
          const Spacer(
            flex: 1,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.11,
            child: Text(
              '${coin.priceChangePercentage24h.toStringAsFixed(1)} %',
              style: TextStyle(
                  fontSize: 15,
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
            ),
          )
        ],
      ),
    );
  }
}
