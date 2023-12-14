part of 'crypto_coin_details_bloc.dart';

sealed class CryptoCoinDetailsState extends Equatable {
  const CryptoCoinDetailsState();

  @override
  List<Object> get props => [];
}

final class CryptoCoinDetailsInitial extends CryptoCoinDetailsState {}

class CryptoCoinDetailsLoaded extends CryptoCoinDetailsState {
  final CryptoCoinDetails coin;
  final String selectedItem;

  final String price;
  final double max;
  final double min;
  final List<ChartData> sparkline;

  final String currentPriceInUsd;
  const CryptoCoinDetailsLoaded({
    required this.coin,
    required this.selectedItem,
    required this.price,
    required this.currentPriceInUsd,
    required this.max,
    required this.min,
    required this.sparkline,
  });
  @override
  List<Object> get props =>
      [coin, selectedItem, price, currentPriceInUsd, sparkline, min, max];
}

class CryptoCoinDetailsLoading extends CryptoCoinDetailsState {}

class CryptoCoinDetailsFailure extends CryptoCoinDetailsState {
  final Object error;

  const CryptoCoinDetailsFailure({required this.error});
  @override
  List<Object> get props => super.props..add(error);
}
