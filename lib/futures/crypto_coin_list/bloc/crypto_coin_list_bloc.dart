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
  bool isLoading = false;

  CryptoCoinListBloc(this.coinRepository) : super(CryptoCoinListInitial()) {
    on<CryptoCoinListEvent>(_loadCryptoCoinList);
  }

  Future<void> _loadCryptoCoinList(
      CryptoCoinListEvent event, Emitter<CryptoCoinListState> emit) async {
    int page = 1;
    try {
      if (event is CryptoCoinListLoadNextPageEvent) {
        isLoading = true;
        final nextPageList = await coinRepository.getCryptoCoinList(page: page);

        coinList.addAll(nextPageList);
        page++;
        emit(CryptoCoinListLoaded(cryptoCoinList: coinList));
      } else {
        isLoading = true;
        coinList.clear();

        final firstPageList =
            await coinRepository.getCryptoCoinList(page: page);
        coinList.addAll(firstPageList);
        emit(CryptoCoinListLoaded(cryptoCoinList: List.from(coinList)));
        isLoading = false;
      }
    } catch (e) {
      log('error: $e');
      emit(CryptoCoinListFailure(error: e));
    } finally {
      isLoading = false;
    }
  }
}
