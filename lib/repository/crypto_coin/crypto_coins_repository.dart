import 'dart:developer';

import 'package:dio/dio.dart';

class CryptoCoinsRepository {
  Future<void> getCryptoCoinList(
      {required String currency,
      required int count,
      required int page,
      required String locale}) async {
    final dio = Dio();

    final Response response = await dio.get(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en');

    log('$response');
  }
}
