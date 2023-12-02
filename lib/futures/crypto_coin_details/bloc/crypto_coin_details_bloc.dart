import 'package:bloc/bloc.dart';
import 'package:crypto_app/repository/abstract_coin_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../repository/crypto_coin/models/crypto_coin_details.dart';

part 'crypto_coin_details_event.dart';
part 'crypto_coin_details_state.dart';

class CryptoCoinDetailsBloc
    extends Bloc<CryptoCoinDetailsEvent, CryptoCoinDetailsState> {
  late CurrentPrice currentPrice;
  late String selectedCurrency;
  final AbstractCoinRepository abstractCoinRepository;
  CryptoCoinDetailsBloc(this.abstractCoinRepository)
      : super(CryptoCoinDetailsInitial()) {
    on<CryptoCoinDetailsLoadEvent>(_getCoinDetailsLoad);
    on<CryptoCoinConvertCoinToCurrency>(_currency);
    on<CryptoCoinConvertCurrencyToCoin>(_coinCount);
    // on<CryptoCoinCurrencySelectedEvent>(_currencySelected);
  }

  Future<void> _coinCount(
    CryptoCoinConvertCurrencyToCoin event,
    Emitter<CryptoCoinDetailsState> emit,
    //  String value
  ) async {
    try {} catch (e) {
      emit(CryptoCoinDetailsFailure(error: e));
    }
  }

  Future<void> _currency(CryptoCoinConvertCoinToCurrency event,
      Emitter<CryptoCoinDetailsState> emit) async {
    try {
// var boba = CurrentPrice.toJson().entries.map((key, value) => null)
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

  // Future<void> _handleDropDownMenu(CryptoCoinCurrencySelectedEvent event,
  //     Emitter<CryptoCoinDetailsState> emit) async {
  //   try {
  //     if (state is CryptoCoinDetailsLoaded) {
  //       final coinState = state as CryptoCoinDetailsLoaded;
  //       currentPrice = coinState.coin.marketData.currentPrice;
  //       emit(CryptoCoinDropDownMenu(currentPrice: currentPrice));
  //     }
  //   } catch (e) {
  //     emit(CryptoCoinDetailsFailure(error: e));
  //   }
  // }

  // Future<void> _currency(CryptoCoinConvertCoinToCurrency event,
  //     Emitter<CryptoCoinDetailsState> emit) async {
  //   try {
  //     // Используем selectedCurrency для нахождения соответствующей цены
  //     final convertedPrice = currentPrice.toJson()[selectedCurrency];
  //     // Здесь можно отправить событие для обновления текстового поля с ценой
  //     emit(CryptoCoinConvertSuccess(convertedPrice: convertedPrice));
  //   } catch (e) {
  //     emit(CryptoCoinDetailsFailure(error: e));
  //   }
  // }
}
