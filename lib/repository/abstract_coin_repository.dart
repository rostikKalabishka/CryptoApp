import 'crypto_coin/models/model.dart';

abstract interface class AbstractCoinRepository {
  Future<List<CryptoCoin>> getCryptoCoinList(
      {required int page, required int perPage});

  Future<CryptoCoinDetails> getCryptoCoinDetails({required String id});

  Future<List<CryptocurrencySearchCoin>> cryptocurrencySearch(
      {required String query});

  Future<List<TrendingCoin>> getTrendingCryptoCoin();
}
