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
      leading: AspectRatio(
        aspectRatio: 20 / 40,
        child: Image.network(
          coin.image,
        ),
      ),
      title: Text('${coin.name} '),
    );
  }
}
