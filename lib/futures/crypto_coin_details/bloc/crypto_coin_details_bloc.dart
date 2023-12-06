import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:crypto_app/repository/abstract_coin_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../repository/crypto_coin/models/crypto_coin_details.dart';

part 'crypto_coin_details_event.dart';
part 'crypto_coin_details_state.dart';

class CryptoCoinDetailsBloc
    extends Bloc<CryptoCoinDetailsEvent, CryptoCoinDetailsState> {
  late String selectedCurrency = 'usd';
  late String price = '0';
  late CryptoCoinDetails coin;
  // late double currencyPrice;

  late double numberCoins = 1.0;

  final AbstractCoinRepository abstractCoinRepository;
  CryptoCoinDetailsBloc(this.abstractCoinRepository)
      : super(CryptoCoinDetailsInitial()) {
    on<CryptoCoinDetailsLoadEvent>(_getCoinDetailsLoad);
    on<CryptoCoinSaveValueInTextFieldEvent>(_currency);
    // on<CryptoCoinConvertCurrencyToCoinEvent>(_coinCount);
    on<CryptoCoinCurrencySelectedEvent>(_getSelectedItem);
  }

  Future<void> _getCoinDetailsLoad(CryptoCoinDetailsLoadEvent event,
      Emitter<CryptoCoinDetailsState> emit) async {
    try {
      if (state is! CryptoCoinDetailsLoaded) {
        emit(CryptoCoinDetailsLoading());
      }
      coin = await abstractCoinRepository.getCryptoCoinDetails(id: event.id);
      log('$coin');
      price = coin.marketData.currentPrice.usd.toString();
      emit(CryptoCoinDetailsLoaded(
        coin: coin,
        selectedItem: selectedCurrency,
        price: price,
      ));
    } catch (e) {
      emit(CryptoCoinDetailsFailure(error: e));
    }
  }

  Future<void> _currency(CryptoCoinSaveValueInTextFieldEvent event,
      Emitter<CryptoCoinDetailsState> emit) async {
    try {
      if (state is CryptoCoinDetailsLoaded) {
        final coinState = state as CryptoCoinDetailsLoaded;
        final double currency =
            coinState.coin.marketData.currentPrice.toJson()[selectedCurrency];

        price = currency.toString();
        emit(CryptoCoinDetailsLoaded(
            coin: coin,
            selectedItem: selectedCurrency,
            price: event.saveValue));
        log('$currency');
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
            coin: coin, selectedItem: selectedCurrency, price: price));

        // emit(CryptoCoinDetailsLoading(selectedItem: selectedCurrency));
        // log('$coin');
        log(selectedCurrency);
        // log('$coin');
        log(price);
      }
    } catch (e) {
      emit(CryptoCoinDetailsFailure(error: e));
      log('$e');
    }
  }

  // Future<void> _coinCount(
  //   CryptoCoinConvertCurrencyToCoinEvent event,
  //   Emitter<CryptoCoinDetailsState> emit,
  //   //  String value
  // ) async {
  //   try {} catch (e) {
  //     emit(CryptoCoinDetailsFailure(error: e));
  //   }
  // }

  // Future<void> _currency(CryptoCoinConvertCoinToCurrencyEvent event,
  //     Emitter<CryptoCoinDetailsState> emit) async {
  //   try {
  //     if (state is CryptoCoinDetailsLoaded) {
  //       final coinState = state as CryptoCoinDetailsLoaded;
  //       final double currency =
  //           coinState.coin.marketData.currentPrice.toJson()[selectedCurrency];

  //       // emit((CryptoCoinCounterToCurrency(currency: currency)));
  //       price = currency.toString();
  //       log('$currency');
  //     }
  //   } catch (e) {
  //     emit(CryptoCoinDetailsFailure(error: e));
  //     log('$e');
  //   }
  // }
}
