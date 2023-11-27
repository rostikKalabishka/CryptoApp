// ignore_for_file: camel_case_types

part of 'crypto_coin_list_bloc.dart';

sealed class CryptoCoinListState extends Equatable {
  const CryptoCoinListState();

  @override
  List<Object> get props => [];
}

enum buttonStateEnum { enable, disable }

final class CryptoCoinListInitial extends CryptoCoinListState {}

final class CryptoCoinListLoading extends CryptoCoinListState {}

final class CryptoCoinListLoaded extends CryptoCoinListState {
  final List<CryptoCoin> cryptoCoinList;

  const CryptoCoinListLoaded({required this.cryptoCoinList});
  @override
  List<Object> get props => super.props..add(cryptoCoinList);
}

final class CryptoCoinListFailure extends CryptoCoinListState {
  final Object error;

  const CryptoCoinListFailure({required this.error});
  @override
  List<Object> get props => super.props..add(error);
}
