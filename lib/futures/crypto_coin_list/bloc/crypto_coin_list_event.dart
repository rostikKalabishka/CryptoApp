part of 'crypto_coin_list_bloc.dart';

sealed class CryptoCoinListEvent extends Equatable {
  const CryptoCoinListEvent();

  @override
  List<Object> get props => [];
}

class CryptoCoinListLoadEvent extends CryptoCoinListEvent {}

class CryptoCoinListLoadNextPageEvent extends CryptoCoinListEvent {}
