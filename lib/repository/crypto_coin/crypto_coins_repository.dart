import 'package:dio/dio.dart';

import 'abstract_coin_repository.dart';

import 'models/model.dart';

class CryptoCoinsRepository implements AbstractCoinRepository {
  const CryptoCoinsRepository({required this.dio});
  final Dio dio;
  @override
  Future<List<CryptoCoin>> getCryptoCoinList({
    required int perPage,
    required int page,
  }) async {
    final Response response = await dio.get(
        'https://api.coingecko.com/api/v3/coins/markets',
        queryParameters: {
          'vs_currency': 'usd',
          'sparkline': true.toString(),
          'locale': 'en',
          'per_page': perPage.toString(),
          'order': 'market_cap_desc',
          'page': page,
        });

    if (response.statusCode == 200) {
      List<dynamic> responseData = response.data as List<dynamic>;
      List<CryptoCoin> coins = responseData
          .map((e) => CryptoCoin.fromJson(e as Map<String, dynamic>))
          .toList();

      return coins;
    } else if (response.statusCode == 429) {
      throw Exception('You\'ve exceeded the Rate Limit');
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Future<CryptoCoinDetails> getCryptoCoinDetails({required String id}) async {
    try {
      final Response response = await dio
          .get('https://api.coingecko.com/api/v3/coins/$id', queryParameters: {
        'sparkline': true.toString(),
      });

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData =
            response.data as Map<String, dynamic>;
        CryptoCoinDetails coin = CryptoCoinDetails.fromJson(responseData);

        return coin;
      } else if (response.statusCode == 429) {
        throw Exception('You\'ve exceeded the Rate Limit');
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<CryptocurrencySearchCoin>> cryptocurrencySearch(
      {required String query}) async {
    try {
      final Response response = await dio
          .get('https://api.coingecko.com/api/v3/search', queryParameters: {
        'query': query,
      });

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData =
            response.data as Map<String, dynamic>;

        final coins = responseData['coins'] as List<dynamic>;

        List<CryptocurrencySearchCoin> queryResponseList = coins
            .map((e) =>
                CryptocurrencySearchCoin.fromJson(e as Map<String, dynamic>))
            .toList();

        return queryResponseList;
      } else if (response.statusCode == 429) {
        throw Exception('You\'ve exceeded the Rate Limit');
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<TrendingCoin>> getTrendingCryptoCoin() async {
    try {
      final Response response =
          await dio.get('https://api.coingecko.com/api/v3/search/trending');

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData =
            response.data as Map<String, dynamic>;

        final coins = responseData['coins'] as List<dynamic>;

        List<TrendingCoin> trendingCryptoList = coins
            .map(
                (e) => TrendingCoin.fromJson(e['item'] as Map<String, dynamic>))
            .toList();

        return trendingCryptoList;
      } else if (response.statusCode == 429) {
        throw Exception('You\'ve exceeded the Rate Limit');
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
