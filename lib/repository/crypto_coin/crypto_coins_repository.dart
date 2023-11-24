import 'dart:developer';

import 'package:dio/dio.dart';

import '../abstract_coin_repository.dart';
import 'models/crypto_coin.dart';

class CryptoCoinsRepository implements AbstractCoinRepository {
  const CryptoCoinsRepository({required this.dio});
  final Dio dio;
  @override
  Future<List<CryptoCoin>> getCryptoCoinList({
    //   required String currency,
    // required int count,
    required int page,
    // required String locale
  }) async {
    final Response response = await dio.get(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=$page&sparkline=true&locale=en');

    if (response.statusCode == 200) {
      List<dynamic> responseData = response.data as List<dynamic>;
      List<CryptoCoin> coins = responseData
          .map((e) => CryptoCoin.fromJson(e as Map<String, dynamic>))
          .toList();
      log('$coins');
      return coins;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
