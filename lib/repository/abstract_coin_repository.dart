import 'crypto_coin/models/crypto_coin_details.dart';
import 'crypto_coin/models/model.dart';

abstract class AbstractCoinRepository {
  Future<List<CryptoCoin>> getCryptoCoinList(
      {required int page, required int perPage});

  Future<CryptoCoinDetails> getCryptoCoinDetails({required String id});
}
