import 'package:crypto_app/repository/auth/model/user.dart';

abstract interface class AbstractDataStorageRepository {
  Future<String> getPortfolioName();

  Future<bool> getTheme();

  Future<void> setTheme({required bool swithBool});

  Future<void> updatePortfolioName({required String newPortfolioName});

  Future<void> updateSettingsUsersInfo();

  Future<UserDetails> getUserInfo();
}
