part of 'crypto_coin_list_bloc.dart';

sealed class CryptoCoinListState extends Equatable {
  const CryptoCoinListState();
  
  @override
  List<Object> get props => [];
}

final class CryptoCoinListInitial extends CryptoCoinListState {}
