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
  bool _isSortedByRank = false;

  bool _isSortedByPrice = false;
  bool _isSortedByMarketCup = false;
  bool _isSortedByPercentChange = false;
  int page = 1;
  late int perPage;

  CryptoCoinListBloc(this.coinRepository) : super(CryptoCoinListInitial()) {
    on<CryptoCoinListEvent>(_loadCryptoCoinList);

    on<CryptoCoinListSorByRankEvent>(_sortByRank);
    on<CryptoCoinListSorByPriceEvent>(_sortByPrice);
    on<CryptoCoinListSorByMarketCupEvent>(_sortByMarketCup);
    on<CryptoCoinListSorByPercentChangeEvent>(_sortByPercentChange);

    on<CryptoCoinListLoadTopFiftyCoinEvent>(_loadTopFiftyCoin);
    on<CryptoCoinListLoadTopTwoHundredFiftyCoinEvent>(
        _loadTopTwoHundredFiftyCoin);
  }

  void _sortByRank(
      CryptoCoinListEvent event, Emitter<CryptoCoinListState> emit) {
    try {
      log('$coinList');

      if (_isSortedByRank == false) {
        coinList.sort((a, b) => b.marketCapRank.compareTo(a.marketCapRank));
      } else if (_isSortedByRank == true) {
        coinList.sort((a, b) => a.marketCapRank.compareTo(b.marketCapRank));
      }
      emit(CryptoCoinListLoaded(cryptoCoinList: List.from(coinList)));
      _isSortedByRank = !_isSortedByRank;
    } catch (e) {
      emit(CryptoCoinListFailure(error: e));
    }
  }

  void _sortByPrice(
      CryptoCoinListEvent event, Emitter<CryptoCoinListState> emit) {
    try {
      log('$coinList');

      if (_isSortedByPrice == false) {
        coinList.sort((a, b) => b.currentPrice.compareTo(a.currentPrice));
      } else if (_isSortedByPrice == true) {
        coinList.sort((a, b) => a.currentPrice.compareTo(b.currentPrice));
      }
      emit(CryptoCoinListLoaded(cryptoCoinList: List.from(coinList)));
      _isSortedByPrice = !_isSortedByPrice;
    } catch (e) {
      emit(CryptoCoinListFailure(error: e));
    }
  }

  void _sortByMarketCup(
      CryptoCoinListEvent event, Emitter<CryptoCoinListState> emit) {
    try {
      log('$coinList');

      if (_isSortedByMarketCup == false) {
        coinList.sort((a, b) => b.marketCap.compareTo(a.marketCap));
      } else if (_isSortedByMarketCup == true) {
        coinList.sort((a, b) => a.marketCap.compareTo(b.marketCap));
      }
      emit(CryptoCoinListLoaded(cryptoCoinList: List.from(coinList)));
      _isSortedByMarketCup = !_isSortedByMarketCup;
    } catch (e) {
      emit(CryptoCoinListFailure(error: e));
    }
  }

  void _sortByPercentChange(
      CryptoCoinListEvent event, Emitter<CryptoCoinListState> emit) {
    try {
      if (_isSortedByPercentChange == false) {
        coinList.sort((a, b) =>
            b.priceChangePercentage24h.compareTo(a.priceChangePercentage24h));
      } else if (_isSortedByPercentChange == true) {
        coinList.sort((a, b) =>
            a.priceChangePercentage24h.compareTo(b.priceChangePercentage24h));
      }
      emit(CryptoCoinListLoaded(cryptoCoinList: List.from(coinList)));
      _isSortedByPercentChange = !_isSortedByPercentChange;
    } catch (e) {
      emit(CryptoCoinListFailure(error: e));
    }
  }

  Future<void> _loadCryptoCoinList(
      CryptoCoinListEvent event, Emitter<CryptoCoinListState> emit) async {
    perPage = 100;
    try {
      if (event is CryptoCoinListLoadNextPageEvent) {
        isLoading = true;
        page += 1;

        await _loadList(emit, isLoading, page, perPage);
      } else if (event is CryptoCoinListLoadEvent) {
        isLoading = true;
        coinList.clear();
        page = 1;
        await _loadList(emit, isLoading, page, perPage);
      }
    } catch (e) {
      log('error: $e');
      emit(CryptoCoinListFailure(error: e));
    } finally {
      isLoading = false;
    }
  }

  Future<void> _loadTopFiftyCoin(
    CryptoCoinListEvent event,
    Emitter<CryptoCoinListState> emit,
  ) async {
    perPage = 50;
    if (event is CryptoCoinListLoadNextPageEvent) {
      isLoading = true;
      page += 1;

      await _loadList(emit, isLoading, page, perPage);
    } else if (event is CryptoCoinListLoadTopFiftyCoinEvent) {
      coinList.clear();
      isLoading = true;

      page = 1;
      await _loadList(emit, isLoading, page, perPage);
    }
  }

  Future<void> _loadTopTwoHundredFiftyCoin(
    CryptoCoinListEvent event,
    Emitter<CryptoCoinListState> emit,
  ) async {
    perPage = 250;
    if (event is CryptoCoinListLoadNextPageEvent) {
      isLoading = true;
      page += 1;

      await _loadList(emit, isLoading, page, perPage);
    } else if (event is CryptoCoinListLoadTopFiftyCoinEvent) {
      coinList.clear();
      isLoading = true;

      page = 1;
      await _loadList(emit, isLoading, page, perPage);
    }
  }

  Future<void> _loadList(Emitter<CryptoCoinListState> emit, bool isLoading,
      int page, int perPage) async {
    final firstPageList =
        await coinRepository.getCryptoCoinList(page: page, perPage: perPage);
    coinList.addAll(firstPageList);
    emit(CryptoCoinListLoaded(cryptoCoinList: List.from(coinList)));
    isLoading = false;
  }
}
