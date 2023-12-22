import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:crypto_app/repository/crypto_coin/abstract_coin_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../repository/crypto_coin/models/crypto_coin_details.dart';
import '../model/chart_data.dart';

part 'crypto_coin_details_event.dart';
part 'crypto_coin_details_state.dart';

class CryptoCoinDetailsBloc
    extends Bloc<CryptoCoinDetailsEvent, CryptoCoinDetailsState> {
  final AbstractCoinRepository abstractCoinRepository;

  CryptoCoinDetailsBloc(this.abstractCoinRepository)
      : super(CryptoCoinDetailsInitial()) {
    on<CryptoCoinDetailsLoadEvent>(_getCoinDetailsLoad);
    on<CryptoCoinSaveValueInTextFieldEvent>(_currency);
    on<CryptoCoinConvertCoinToCurrencyEvent>(_coinCount);
    on<CryptoCoinCurrencySelectedEvent>(_getSelectedItem);
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
      // basePrice = price;
      final String coinDetailsPrice =
          coin.marketData.currentPrice.usd.toString();
      final currentPriceInUsd = coin.marketData.currentPrice.usd.toString();
      final detailsInfoForChart = coin.marketData.sparkLine7d;
      final sparkline = detailsInfoForChart.price.asMap().entries.map((entry) {
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
      emit(CryptoCoinDetailsLoaded(
          max: max + (max * 0.05),
          min: min - (min * 0.05),
          sparkline: sparkline,
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
        final price = (double.parse(event.saveValue) *
                double.parse(currentState.currentPriceInUsd))
            .toString();
        final updateState =
            currentState.copyWith(price: price, counterCoin: event.saveValue);

        emit(updateState);
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
        final counterCoin = (double.parse(event.price) /
                double.parse(currentState.currentPriceInUsd))
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
