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
  List<CryptoCoin> coinList = [];

  CryptoCoinListBloc(this.coinRepository) : super(CryptoCoinListInitial()) {
    on<CryptoCoinListEvent>(_loadCryptoCoinList);
  }

  Future<void> _loadCryptoCoinList(
      CryptoCoinListEvent event, Emitter<CryptoCoinListState> emit) async {
    int page = 1;
    try {
      if (event is CryptoCoinListLoadNextPageEvent) {
        final nextPageList = await coinRepository.getCryptoCoinList(page: page);

        coinList.addAll(nextPageList);
        emit(CryptoCoinListLoaded(cryptoCoinList: coinList));
        page++;
      } else {
        coinList.clear();

        final firstPageList =
            await coinRepository.getCryptoCoinList(page: page);
        coinList.addAll(firstPageList);
        emit(CryptoCoinListLoaded(cryptoCoinList: List.from(coinList)));
      }
    } catch (e) {
      log('error: $e');
      emit(CryptoCoinListFailure(error: e));
    } finally {}
  }
}
