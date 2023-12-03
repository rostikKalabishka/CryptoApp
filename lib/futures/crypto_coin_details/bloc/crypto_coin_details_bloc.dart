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

  final AbstractCoinRepository abstractCoinRepository;
  CryptoCoinDetailsBloc(this.abstractCoinRepository)
      : super(CryptoCoinDetailsInitial()) {
    on<CryptoCoinDetailsLoadEvent>(_getCoinDetailsLoad);
    on<CryptoCoinConvertCoinToCurrencyEvent>(_currency);
    on<CryptoCoinConvertCurrencyToCoinEvent>(_coinCount);
    on<CryptoCoinCurrencySelectedEvent>(_getSelectedItem);
  }

  Future<void> _coinCount(
    CryptoCoinConvertCurrencyToCoinEvent event,
    Emitter<CryptoCoinDetailsState> emit,
    //  String value
  ) async {
    try {} catch (e) {
      emit(CryptoCoinDetailsFailure(error: e));
    }
  }

  Future<void> _currency(CryptoCoinConvertCoinToCurrencyEvent event,
      Emitter<CryptoCoinDetailsState> emit) async {
    try {
      if (state is CryptoCoinDetailsLoaded) {
        final coinState = state as CryptoCoinDetailsLoaded;
        final double currency =
            coinState.coin.marketData.currentPrice.toJson()[selectedCurrency];

        emit((CryptoCoinCounterToCurrency(currency: currency)));
        log('$currency');
        // boba = currency.toString();
      }
    } catch (e) {
      emit(CryptoCoinDetailsFailure(error: e));
    }
  }

  Future<void> _getCoinDetailsLoad(CryptoCoinDetailsLoadEvent event,
      Emitter<CryptoCoinDetailsState> emit) async {
    try {
      if (state is! CryptoCoinDetailsLoaded) {
        emit(CryptoCoinDetailsLoading());
      }
      final coin =
          await abstractCoinRepository.getCryptoCoinDetails(id: event.id);

      emit(CryptoCoinDetailsLoaded(coin: coin));
    } catch (e) {
      emit(CryptoCoinDetailsFailure(error: e));
    }
  }

  Future<void> _getSelectedItem(CryptoCoinCurrencySelectedEvent event,
      Emitter<CryptoCoinDetailsState> emit) async {
    try {
      selectedCurrency = event.selectedCurrency;
      emit(CryptoCoinDropDownMenuSelectedItem(selectedItem: selectedCurrency));
// виправити віджети (Я КЛОУН)
      // final double currency = state.coin.marketData.currentPrice.jpy;

      // emit(CryptoCoinCounterToCurrency(currency: currency));

      log(selectedCurrency);
    } catch (e) {
      emit(CryptoCoinDetailsFailure(error: e));
    }
  }
}
