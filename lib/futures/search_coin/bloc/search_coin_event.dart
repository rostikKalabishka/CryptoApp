part of 'search_coin_bloc.dart';

sealed class SearchCoinEvent extends Equatable {
  const SearchCoinEvent();

  @override
  List<Object> get props => [];
}

class SearchQueryEvent extends SearchCoinEvent {
  final String query;

  const SearchQueryEvent({required this.query});
  @override
  List<Object> get props => super.props..add(query);
}

class TrendingCoinListLoadedEvent extends SearchCoinEvent {
  const TrendingCoinListLoadedEvent();
}
