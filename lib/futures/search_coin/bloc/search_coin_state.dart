part of 'search_coin_bloc.dart';

sealed class SearchCoinState extends Equatable {
  const SearchCoinState();

  @override
  List<Object> get props => [];
}

final class SearchCoinInitial extends SearchCoinState {}

final class SearchCoinLoading extends SearchCoinState {}

final class SearchCoinLoadedQuery extends SearchCoinState {
  final List<CryptocurrencySearchCoin> cryptocurrencySearchCoin;

  const SearchCoinLoadedQuery({required this.cryptocurrencySearchCoin});
  @override
  List<Object> get props => super.props..add(cryptocurrencySearchCoin);
}

final class SearchCoinFailure extends SearchCoinState {
  final Object error;

  const SearchCoinFailure({required this.error});
  @override
  List<Object> get props => super.props..add(error);
}
