import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:crypto_app/futures/portfolio/model/coin_user_data.dart';
import 'package:crypto_app/repository/crypto_coin/abstract_coin_repository.dart';
import 'package:crypto_app/repository/data_storage_repository/abstract_data_storage_repository.dart';
import 'package:crypto_app/repository/data_storage_repository/data_storage_repository.dart';
import 'package:equatable/equatable.dart';
import '../../../repository/crypto_coin/models/crypto_coin_details.dart';
import '../model/chart_data.dart';
part 'crypto_coin_details_event.dart';
part 'crypto_coin_details_state.dart';

class CryptoCoinDetailsBloc
    extends Bloc<CryptoCoinDetailsEvent, CryptoCoinDetailsState> {
  final AbstractCoinRepository abstractCoinRepository;
  final AbstractDataStorageRepository abstractDataStorageRepository;

  CryptoCoinDetailsBloc(
      this.abstractCoinRepository, this.abstractDataStorageRepository)
      : super(CryptoCoinDetailsInitial()) {
    on<CryptoCoinDetailsLoadEvent>(_getCoinDetailsLoad);
    on<CryptoCoinSaveValueInTextFieldEvent>(_currency);
    on<CryptoCoinConvertCoinToCurrencyEvent>(_coinCount);
    on<CryptoCoinCurrencySelectedEvent>(_getSelectedItem);
    on<CryptoCoinAddToPortfolio>(_addToPortfolio);
    on<CryptoCoinRemoveFromPortfolio>(_removeFromPortfolio);
  }

  Future<void> _getCoinDetailsLoad(
    CryptoCoinDetailsLoadEvent event,
    Emitter<CryptoCoinDetailsState> emit,
  ) async {
    try {
      if (state is! CryptoCoinDetailsLoaded) {
        emit(CryptoCoinDetailsLoading());
      }
      final coin =
          await abstractCoinRepository.getCryptoCoinDetails(id: event.id);
      final dropDownList = coin.marketData.currentPrice
          .toJson()
          .keys
          .toList()
          .reversed
          .map((e) => e.toString())
          .toList();

      final selectedCurrency = dropDownList.first.toLowerCase();
      final price =
          coin.marketData.currentPrice.toJson()[selectedCurrency].toString();

      final String coinDetailsPrice =
          coin.marketData.currentPrice.usd.toString();
      final currentPriceInUsd = coin.marketData.currentPrice.usd.toString();
      final detailsInfoForChart = coin.marketData.sparkLine7d;
      final sparkLine = detailsInfoForChart.price.asMap().entries.map((entry) {
        return ChartData.fromJson({
          'price': entry.value,
          'index': entry.key + 1,
        });
      }).toList();
      var max = detailsInfoForChart.price.reduce(
          (currentMax, price) => currentMax < price ? price : currentMax);
      var min = detailsInfoForChart.price.reduce(
          (currentMax, price) => currentMax > price ? price : currentMax);

      final counterCoin =
          (double.parse(price) / double.parse(price)).toString();
      final inPortfolio = await abstractDataStorageRepository
          .checkCryptoCurrencyInPortfolio(id: coin.id);
      emit(CryptoCoinDetailsLoaded(
          inPortfolio: inPortfolio,
          max: max + (max * 0.05),
          min: min - (min * 0.05),
          sparkLine: sparkLine,
          coin: coin,
          selectedItem: selectedCurrency,
          price: price,
          currentPriceInUsd: currentPriceInUsd,
          dropDownList: dropDownList,
          counterCoin: counterCoin,
          coinDetailsPrice: coinDetailsPrice));
    } catch (e) {
      emit(CryptoCoinDetailsFailure(error: e));
    }
  }

  Future<void> _currency(CryptoCoinSaveValueInTextFieldEvent event,
      Emitter<CryptoCoinDetailsState> emit) async {
    final currentState = state;
    try {
      if (currentState is CryptoCoinDetailsLoaded) {
        final count = event.saveValue.isEmpty ? '0' : event.saveValue;
        final price =
            (double.parse(count) * double.parse(currentState.currentPriceInUsd))
                .toString();
        final updateState =
            currentState.copyWith(price: price, counterCoin: count);

        emit(updateState);
      }
    } catch (e) {
      emit(CryptoCoinDetailsFailure(error: e));
    }
  }

  Future<void> _addToPortfolio(CryptoCoinAddToPortfolio event,
      Emitter<CryptoCoinDetailsState> emit) async {
    final currentState = state;
    try {
      if (currentState is CryptoCoinDetailsLoaded) {
        final currentCoin = currentState.coin;
        final currentPriceInUsd =
            double.parse(currentCoin.marketData.currentPrice.usd.toString());
        await abstractDataStorageRepository
            .addOrRemoveCryptoCurrencyToPortfolio(
                coinUserData: CoinUserData(
                    symbol: currentCoin.symbol,
                    cryptocurrencyName: currentCoin.name,
                    priceCurrent: currentPriceInUsd,
                    id: currentCoin.id,
                    image: currentCoin.image.small,
                    rank: currentCoin.marketData.marketCapRank,
                    priceWhichBought: currentPriceInUsd,
                    emountCoins: 0),
                action: PortfolioAction.add);
        final newState = currentState;
        emit(newState.copyWith(inPortfolio: true));
      }
    } catch (e) {
      emit(CryptoCoinDetailsFailure(error: e));
    }
  }

  Future<void> _removeFromPortfolio(CryptoCoinRemoveFromPortfolio event,
      Emitter<CryptoCoinDetailsState> emit) async {
    final currentState = state;
    try {
      if (currentState is CryptoCoinDetailsLoaded) {
        final currentCoin = currentState.coin;
        final currentPriceInUsd =
            double.parse(currentCoin.marketData.currentPrice.usd.toString());
        await abstractDataStorageRepository
            .addOrRemoveCryptoCurrencyToPortfolio(
                coinUserData: CoinUserData(
                    symbol: currentCoin.symbol,
                    cryptocurrencyName: currentCoin.name,
                    priceCurrent: currentPriceInUsd,
                    id: currentCoin.id,
                    image: currentCoin.image.small,
                    rank: currentCoin.marketData.marketCapRank,
                    priceWhichBought: currentPriceInUsd,
                    emountCoins: 0),
                action: PortfolioAction.remove);

        final newState = currentState;
        emit(newState.copyWith(inPortfolio: false));
      }
    } catch (e) {
      emit(CryptoCoinDetailsFailure(error: e));
    }
  }

  Future<void> _coinCount(CryptoCoinConvertCoinToCurrencyEvent event,
      Emitter<CryptoCoinDetailsState> emit) async {
    final currentState = state;

    try {
      if (currentState is CryptoCoinDetailsLoaded) {
        final price = event.price.isEmpty ? '0' : event.price;
        final counterCoin =
            (double.parse(price) / double.parse(currentState.currentPriceInUsd))
                .toString();
        final updateState =
            currentState.copyWith(counterCoin: counterCoin, price: event.price);

        emit(updateState);
      }
    } catch (e) {
      emit(CryptoCoinDetailsFailure(error: e));
    }
  }

  Future<void> _getSelectedItem(CryptoCoinCurrencySelectedEvent event,
      Emitter<CryptoCoinDetailsState> emit) async {
    final currentState = state;
    try {
      if (currentState is CryptoCoinDetailsLoaded) {
        final selectedCurrency = event.selectedCurrency;
        final String currentPriceInUsd = currentState
            .coin.marketData.currentPrice
            .toJson()[selectedCurrency]
            .toString();
        final String price = (double.parse(currentState.counterCoin) *
                double.parse(currentPriceInUsd))
            .toString();

        final updateState = currentState.copyWith(
            selectedItem: selectedCurrency,
            currentPriceInUsd: currentPriceInUsd,
            price: price);

        emit(updateState);
      }
    } catch (e) {
      emit(CryptoCoinDetailsFailure(error: e));
      log('$e');
    }
  }
}
