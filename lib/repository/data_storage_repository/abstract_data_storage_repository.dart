import 'package:crypto_app/futures/portfolio/model/coin_user_data.dart';
import 'package:crypto_app/repository/auth/model/user.dart';
import 'package:crypto_app/repository/data_storage_repository/data_storage_repository.dart';
import 'package:image_picker/image_picker.dart';

abstract interface class AbstractDataStorageRepository {
  Future<bool> getTheme();

  Future<void> setTheme({required bool swithBool});

  Future<void> updatePortfolioName({required String newPortfolioName});

  Future<void> updateSettingsUsersInfo(
      {required String username, required String image});

  Future<UserDetails> getUserInfo();

  Future<XFile?> pickImage();

  Future<void> addOrRemoveCryptoCurrencyToPortfolio({
    required CoinUserData coinUserData,
    required PortfolioAction action,
  });
  Future<bool> checkCryptoCurrencyInPortfolio({
    required String id,
  });
}
