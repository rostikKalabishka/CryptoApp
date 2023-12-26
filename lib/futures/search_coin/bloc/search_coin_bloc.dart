import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

import '../../../repository/crypto_coin/abstract_coin_repository.dart';
import '../../../repository/crypto_coin/models/model.dart';

part 'search_coin_event.dart';
part 'search_coin_state.dart';

class SearchCoinBloc extends Bloc<SearchCoinEvent, SearchCoinState> {
  final AbstractCoinRepository abstractCoinRepository;

  Timer? searchDebounce;
  SearchCoinBloc(this.abstractCoinRepository) : super(SearchCoinInitial()) {
    on<SearchCoinEvent>((event, emit) async {
      if (event is SearchQueryEvent) {
        await _searchQuery(event, emit);
      } else if (event is TrendingCoinListLoadedEvent) {
        await _getTrendingList(event, emit);
      }
    }, transformer: sequential());
  }

  Future<void> _searchQuery(
      SearchQueryEvent event, Emitter<SearchCoinState> emit) async {
    searchDebounce?.cancel();

    final completer = Completer<void>();

    searchDebounce = Timer(const Duration(milliseconds: 200), () async {
      final coinList =
          await abstractCoinRepository.cryptocurrencySearch(query: event.query);
      emit(SearchCoinLoadedQuery(cryptocurrencySearchCoin: coinList));

      completer.complete();
    });

    await completer.future;
  }

  Future<void> _getTrendingList(
      TrendingCoinListLoadedEvent event, Emitter<SearchCoinState> emit) async {
    final coinList = await abstractCoinRepository.getTrendingCryptoCoin();
    emit(TrendingCryptoLoaded(trendingCryptoList: coinList));
  }
}
