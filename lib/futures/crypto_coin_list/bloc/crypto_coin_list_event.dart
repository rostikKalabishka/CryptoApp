part of 'crypto_coin_list_bloc.dart';

sealed class CryptoCoinListEvent extends Equatable {
  const CryptoCoinListEvent();

  @override
  List<Object> get props => [];
}

class CryptoCoinListLoadEvent extends CryptoCoinListEvent {}

class CryptoCoinListLoadNextPageEvent extends CryptoCoinListEvent {}

class CryptoCoinListSorByRankEvent extends CryptoCoinListEvent {}

class CryptoCoinListSorByMarketCupEvent extends CryptoCoinListEvent {}

class CryptoCoinListSorByPriceEvent extends CryptoCoinListEvent {}

class CryptoCoinListSorByPercentChangeEvent extends CryptoCoinListEvent {}
