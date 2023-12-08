import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../repository/abstract_coin_repository.dart';
import '../../../repository/crypto_coin/models/model.dart';

part 'search_coin_event.dart';
part 'search_coin_state.dart';

class SearchCoinBloc extends Bloc<SearchCoinEvent, SearchCoinState> {
  final AbstractCoinRepository abstractCoinRepository;
  // late StreamController<String> _searchController;
  // StreamSubscription<String>? _searchSubscription;
  // Timer? searchDebounce;
  SearchCoinBloc(this.abstractCoinRepository) : super(SearchCoinInitial()) {
    on<SearchQueryEvent>(_searchQuery);
    on<TrendingCoinListLoadedEvent>(_getTrendingList);
  }

  Future<void> _searchQuery(
      SearchQueryEvent event, Emitter<SearchCoinState> emit) async {
    // searchDebounce?.cancel();
    // searchDebounce = Timer(const Duration(milliseconds: 500), () async {
    // await Future.delayed(const Duration(milliseconds: 500));
    final coinList =
        await abstractCoinRepository.cryptocurrencySearch(query: event.query);
    emit(SearchCoinLoadedQuery(cryptocurrencySearchCoin: coinList));
    // });
    // await Future.delayed(const Duration(milliseconds: 500));
  }

  Future<void> _getTrendingList(
      TrendingCoinListLoadedEvent event, Emitter<SearchCoinState> emit) async {
    final coinList = await abstractCoinRepository.getTrendingCryptoCoin();
    emit(TrendingCryptoLoaded(trendingCryptoList: coinList));
  }
}
