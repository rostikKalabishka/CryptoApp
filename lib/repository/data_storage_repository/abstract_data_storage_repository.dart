import 'package:crypto_app/futures/portfolio/model/coin_user_data.dart';
import 'package:crypto_app/repository/auth/model/user.dart';
import 'package:crypto_app/repository/data_storage_repository/data_storage_repository.dart';

abstract interface class AbstractDataStorageRepository {
  Future<String> getPortfolioName();

  Future<bool> getTheme();

  Future<void> setTheme({required bool swithBool});

  Future<void> updatePortfolioName({required String newPortfolioName});

  Future<void> updateSettingsUsersInfo();

  Future<UserDetails> getUserInfo();

  Future<void> addOrRemoveCryptoCurrencyToPortfolio({
    required CoinUserData coinUserData,
    required PortfolioAction action,
  });
  Future<bool> checkCryptoCurrencyInPortfolio({
    required CoinUserData coinUserData,
  });
}
