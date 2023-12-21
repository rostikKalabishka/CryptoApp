import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../repository/crypto_coin/abstract_coin_repository.dart';
import '../../../repository/crypto_coin/models/model.dart';

part 'crypto_coin_list_event.dart';
part 'crypto_coin_list_state.dart';

enum SortFilters { rank, price, marketCap, percentChange }

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

    on<CryptoCoinListSorByRankEvent>((event, emit) => _sortByFilters(
          emit,
          SortFilters.rank,
        ));
    on<CryptoCoinListSorByPriceEvent>((event, emit) => _sortByFilters(
          emit,
          SortFilters.price,
        ));
    on<CryptoCoinListSorByMarketCupEvent>((event, emit) => _sortByFilters(
          emit,
          SortFilters.marketCap,
        ));
    on<CryptoCoinListSorByPercentChangeEvent>((event, emit) => _sortByFilters(
          emit,
          SortFilters.percentChange,
        ));

    on<CryptoCoinListLoadTopFiftyCoinEvent>(_loadTopFiftyCoin);
    on<CryptoCoinListLoadTopTwoHundredFiftyCoinEvent>(
        _loadTopTwoHundredFiftyCoin);
  }

  void _sortByFilters(Emitter<CryptoCoinListState> emit, SortFilters filter) {
    try {
      switch (filter) {
        case SortFilters.rank:
          _isSortedByRank == false
              ? coinList.sort(sorters[SortFilters.rank])
              : coinList.sort((a, b) => sorters[SortFilters.rank]!(b, a));
          _isSortedByRank = !_isSortedByRank;
        case SortFilters.price:
          _isSortedByPrice == false
              ? coinList.sort(sorters[SortFilters.price])
              : coinList.sort((a, b) => sorters[SortFilters.price]!(b, a));
          _isSortedByPrice = !_isSortedByPrice;
        case SortFilters.marketCap:
          _isSortedByMarketCup == false
              ? coinList.sort(sorters[SortFilters.marketCap])
              : coinList.sort((a, b) => sorters[SortFilters.marketCap]!(b, a));
          _isSortedByMarketCup = !_isSortedByMarketCup;
        case SortFilters.percentChange:
          _isSortedByPercentChange == false
              ? coinList.sort(sorters[SortFilters.percentChange])
              : coinList
                  .sort((a, b) => sorters[SortFilters.percentChange]!(b, a));
          _isSortedByPercentChange = !_isSortedByPercentChange;
      }
      emit(CryptoCoinListLoaded(cryptoCoinList: List.from(coinList)));
    } catch (e) {
      emit(CryptoCoinListFailure(error: e));
    }
  }

  Map<SortFilters, int Function(CryptoCoin a, CryptoCoin b)> sorters = {
    SortFilters.rank: (a, b) => b.marketCapRank.compareTo(a.marketCapRank),
    SortFilters.marketCap: (a, b) => b.marketCap.compareTo(a.marketCap),
    SortFilters.price: (a, b) => b.currentPrice.compareTo(a.currentPrice),
    SortFilters.percentChange: (a, b) =>
        b.priceChangePercentage24h.compareTo(a.priceChangePercentage24h),
  };

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
