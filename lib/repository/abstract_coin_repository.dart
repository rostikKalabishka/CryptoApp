import 'crypto_coin/models/model.dart';

abstract class AbstractCoinRepository {
  Future<List<CryptoCoin>> getCryptoCoinList(
      {required int page, required int perPage});
}
