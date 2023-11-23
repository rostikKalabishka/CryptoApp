import 'package:flutter/material.dart';

import 'ui/theme/theme.dart';
import 'futures/crypto_coin_list/view/crypto_coin_list.dart';

class CryptoApp extends StatelessWidget {
  const CryptoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: darkTheme,
      home: const CryptoCoinListScreen(),
    );
  }
}
