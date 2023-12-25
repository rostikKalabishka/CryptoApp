// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types

part of 'crypto_coin_list_bloc.dart';

sealed class CryptoCoinListState extends Equatable {
  const CryptoCoinListState();

  @override
  List<Object> get props => [];
}

final class CryptoCoinListInitial extends CryptoCoinListState {}

final class CryptoCoinListLoading extends CryptoCoinListState {}

class CryptoCoinListLoaded extends CryptoCoinListState {
  final List<CryptoCoin> cryptoCoinList;

  const CryptoCoinListLoaded({required this.cryptoCoinList});
  @override
  List<Object> get props => super.props..add(cryptoCoinList);

  CryptoCoinListLoaded copyWith({
    List<CryptoCoin>? cryptoCoinList,
  }) {
    return CryptoCoinListLoaded(
      cryptoCoinList: cryptoCoinList ?? this.cryptoCoinList,
    );
  }
}

// class CryptoCoinListLoadedNextPage extends CryptoCoinListState {}

final class CryptoCoinListFailure extends CryptoCoinListState {
  final Object error;

  const CryptoCoinListFailure({required this.error});
  @override
  List<Object> get props => super.props..add(error);
}
