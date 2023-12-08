import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../repository/abstract_coin_repository.dart';
import '../../../repository/crypto_coin/models/model.dart';

part 'search_coin_event.dart';
part 'search_coin_state.dart';

class SearchCoinBloc extends Bloc<SearchCoinEvent, SearchCoinState> {
  final AbstractCoinRepository abstractCoinRepository;
  SearchCoinBloc(this.abstractCoinRepository) : super(SearchCoinInitial()) {
    on<SearchQueryEvent>(_searchQuery);
  }

  Future<void> _searchQuery(
      SearchQueryEvent event, Emitter<SearchCoinState> emit) async {}
}
