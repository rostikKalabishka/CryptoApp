import 'crypto_coin/models/model.dart';

abstract class AbstractCoinRepository {
  Future<List<CryptoCoin>> getCryptoCoinList();
}
