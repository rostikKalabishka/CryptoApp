part of 'crypto_coin_details_bloc.dart';

sealed class CryptoCoinDetailsState extends Equatable {
  const CryptoCoinDetailsState();

  @override
  List<Object> get props => [];
}

final class CryptoCoinDetailsInitial extends CryptoCoinDetailsState {}

class CryptoCoinDetailsLoaded extends CryptoCoinDetailsState {
  final CryptoCoinDetails coin;

  const CryptoCoinDetailsLoaded({required this.coin});
  @override
  List<Object> get props => [coin];
}

class CryptoCoinDetailsLoading extends CryptoCoinDetailsState {}

class CryptoCoinDetailsFailure extends CryptoCoinDetailsState {
  final Object error;

  const CryptoCoinDetailsFailure({required this.error});
  @override
  List<Object> get props => super.props..add(error);
}

class CryptoCoinDropDownMenu extends CryptoCoinDetailsState {
  final CurrentPrice currentPrice;

  const CryptoCoinDropDownMenu({required this.currentPrice});
  @override
  List<Object> get props => [currentPrice];
}
