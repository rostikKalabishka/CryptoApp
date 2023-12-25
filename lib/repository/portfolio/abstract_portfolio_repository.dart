abstract interface class AbstractPortfolioRepository {
  Future<void> addCryptoCurrencyInPortfolio();
  Future<void> deleteCryptoCurrencyInPortfolio();
  Future<void> checkCryptoCurrencyInPortfolio();

  Future<List> listPortfolio();
}
