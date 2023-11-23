import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../repository/abstract_coin_repository.dart';
import '../../../repository/crypto_coin/models/model.dart';

part 'crypto_coin_list_event.dart';
part 'crypto_coin_list_state.dart';

class CryptoCoinListBloc
    extends Bloc<CryptoCoinListEvent, CryptoCoinListState> {
  final AbstractCoinRepository coinRepository;
  CryptoCoinListBloc(this.coinRepository) : super(CryptoCoinListInitial()) {
    on<CryptoCoinListEvent>(_loadCryptoCoinList);
  }

  Future<void> _loadCryptoCoinList(
      CryptoCoinListEvent event, Emitter<CryptoCoinListState> emit) async {
    try {
      final coinList = await coinRepository.getCryptoCoinList();
      emit(CryptoCoinListLoaded(cryptoCoinList: coinList));
    } catch (e) {
      log('error: $e');
      emit(CryptoCoinListFailure(error: e));
    } finally {}
  }
}
