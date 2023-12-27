abstract interface class AbstractDataStorageRepository {
  Future<String> getPortfolioName();

  Future<bool> getTheme();

  Future<String> setPortfolioName();

  Future<void> setTheme({required bool swithBool});
}
