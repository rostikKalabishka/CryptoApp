import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:crypto_app/repository/abstract_coin_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../repository/crypto_coin/models/crypto_coin_details.dart';
import '../model/chart_data.dart';

part 'crypto_coin_details_event.dart';
part 'crypto_coin_details_state.dart';

class CryptoCoinDetailsBloc
    extends Bloc<CryptoCoinDetailsEvent, CryptoCoinDetailsState> {
  late String selectedCurrency = 'usd';
  late String price = '0';
  late String basePrice = '0';
  late CryptoCoinDetails coin;
  late String currencyPrice;
  late String currentPriceInUsd;
  late List<ChartData> sparkline;
  late double max;
  late double min;

  late String numberCoins = '1.0';

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
      coin = await abstractCoinRepository.getCryptoCoinDetails(id: event.id);

      price = coin.marketData.currentPrice.usd.toString();
      basePrice = price;

      currentPriceInUsd = coin.marketData.currentPrice.usd.toString();
      final detailsInfoForChart = coin.marketData.sparkLine7d;
      sparkline = detailsInfoForChart.price.asMap().entries.map((entry) {
        return ChartData.fromJson({
          'price': entry.value,
          'index': entry.key + 1,
        });
      }).toList();
      max = detailsInfoForChart.price.reduce(
          (currentMax, price) => currentMax < price ? price : currentMax);
      min = detailsInfoForChart.price.reduce(
          (currentMax, price) => currentMax > price ? price : currentMax);
      emit(CryptoCoinDetailsLoaded(
          max: max + (max * 0.05),
          min: min - (min * 0.05),
          sparkline: sparkline,
          coin: coin,
          selectedItem: selectedCurrency,
          price: price,
          currentPriceInUsd: currentPriceInUsd));
    } catch (e) {
      emit(CryptoCoinDetailsFailure(error: e));
    }
  }

  Future<void> _currency(CryptoCoinSaveValueInTextFieldEvent event,
      Emitter<CryptoCoinDetailsState> emit
      // , String inputNumber
      ) async {
    try {
      if (state is CryptoCoinDetailsLoaded) {
        currencyPrice =
            (double.parse(event.saveValue) * double.parse(price)).toString();

        emit(CryptoCoinDetailsLoaded(
            sparkline: sparkline,
            max: max,
            min: min,
            coin: coin,
            selectedItem: selectedCurrency,
            price: currencyPrice,
            currentPriceInUsd: currentPriceInUsd));
      }
    } catch (e) {
      emit(CryptoCoinDetailsFailure(error: e));
      log('$e');
    }
  }

  Future<void> _getSelectedItem(CryptoCoinCurrencySelectedEvent event,
      Emitter<CryptoCoinDetailsState> emit) async {
    try {
      if (state is CryptoCoinDetailsLoaded) {
        final selectedCurrency = event.selectedCurrency;
        price =
            coin.marketData.currentPrice.toJson()[selectedCurrency].toString();
        emit(CryptoCoinDetailsLoaded(
            sparkline: sparkline,
            max: max,
            min: min,
            coin: coin,
            selectedItem: selectedCurrency,
            price: price,
            currentPriceInUsd: currentPriceInUsd));

        // log(selectedCurrency);

        // log(price);
      }
    } catch (e) {
      emit(CryptoCoinDetailsFailure(error: e));
      log('$e');
    }
  }

  Future<void> _coinCount(CryptoCoinConvertCoinToCurrencyEvent event,
      Emitter<CryptoCoinDetailsState> emit) async {
    try {
      if (state is CryptoCoinDetailsLoaded) {
        numberCoins = numberCoins.isEmpty
            ? '1.0'
            : (double.parse(currencyPrice) / double.parse(basePrice))
                .toString();

        // log(numberCoins);
      }
    } catch (e) {
      emit(CryptoCoinDetailsFailure(error: e));
      log('$e');
    }
  }
}
