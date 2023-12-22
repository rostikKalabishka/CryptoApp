// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  final String counterCoin;

  final String price;
  final double max;
  final double min;
  final List<ChartData> sparkline;
  final List<String> dropDownList;

  final String currentPriceInUsd;
  const CryptoCoinDetailsLoaded({
    required this.counterCoin,
    required this.dropDownList,
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

  CryptoCoinDetailsLoaded copyWith({
    CryptoCoinDetails? coin,
    String? selectedItem,
    String? counterCoin,
    String? price,
    double? max,
    double? min,
    List<ChartData>? sparkline,
    List<String>? dropDownList,
    String? currentPriceInUsd,
  }) {
    return CryptoCoinDetailsLoaded(
      coin: coin ?? this.coin,
      selectedItem: selectedItem ?? this.selectedItem,
      counterCoin: counterCoin ?? this.counterCoin,
      price: price ?? this.price,
      max: max ?? this.max,
      min: min ?? this.min,
      sparkline: sparkline ?? this.sparkline,
      dropDownList: dropDownList ?? this.dropDownList,
      currentPriceInUsd: currentPriceInUsd ?? this.currentPriceInUsd,
    );
  }
}

class CryptoCoinDetailsLoading extends CryptoCoinDetailsState {}

class CryptoCoinDetailsFailure extends CryptoCoinDetailsState {
  final Object error;

  const CryptoCoinDetailsFailure({required this.error});
  @override
  List<Object> get props => super.props..add(error);
}

class CryptoCoinCurrency extends CryptoCoinDetailsState {
  final String price;
  // final String numberCoins;

  const CryptoCoinCurrency({
    required this.price,
    // required this.numberCoins
  });
  @override
  List<Object> get props => super.props..addAll([price]);
}

class CryptoCoinCounter extends CryptoCoinDetailsState {
  final String numberCoins;
  // final String price;

  const CryptoCoinCounter({
    required this.numberCoins,
    // required this.price
  });
  @override
  List<Object> get props => super.props..addAll([numberCoins]);
}

class CryptoCoinCurrencySelected extends CryptoCoinDetailsState {
  final String selectedCurrency;

  const CryptoCoinCurrencySelected({required this.selectedCurrency});
  @override
  List<Object> get props => super.props..addAll([selectedCurrency]);
}
