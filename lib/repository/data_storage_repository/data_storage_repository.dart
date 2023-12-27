import 'package:crypto_app/repository/data_storage_repository/abstract_data_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataStorageRepository implements AbstractDataStorageRepository {
  final SharedPreferences sharedPreferences;

  DataStorageRepository({required this.sharedPreferences});

  static const themeKey = 'theme_key';

  @override
  Future<String> getPortfolioName() {
    throw UnimplementedError();
  }

  @override
  Future<bool> getTheme() async {
    return sharedPreferences.getBool(themeKey) ?? true;
  }

  @override
  Future<String> setPortfolioName() {
    throw UnimplementedError();
  }

  @override
  Future<void> setTheme({required bool swithBool}) async {
    await sharedPreferences.setBool(themeKey, swithBool);
  }
}
