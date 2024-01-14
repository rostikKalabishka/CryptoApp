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
  final String coinDetailsPrice;
  final String price;
  final double max;
  final double min;
  final List<ChartData> sparkLine;
  final List<String> dropDownList;
  final bool inPortfolio;
  final String siteName;

  final String currentPriceInUsd;
  const CryptoCoinDetailsLoaded(
      {required this.counterCoin,
      required this.dropDownList,
      required this.coin,
      required this.selectedItem,
      required this.price,
      required this.coinDetailsPrice,
      required this.currentPriceInUsd,
      required this.max,
      required this.min,
      required this.sparkLine,
      required this.siteName,
      required this.inPortfolio});
  @override
  List<Object> get props => [
        counterCoin,
        dropDownList,
        coin,
        selectedItem,
        price,
        coinDetailsPrice,
        currentPriceInUsd,
        max,
        min,
        sparkLine,
        inPortfolio,
        siteName
      ];

  CryptoCoinDetailsLoaded copyWith(
      {CryptoCoinDetails? coin,
      String? selectedItem,
      String? counterCoin,
      String? price,
      double? max,
      double? min,
      List<ChartData>? sparkLine,
      List<String>? dropDownList,
      String? currentPriceInUsd,
      String? coinDetailsPrice,
      bool? inPortfolio,
      String? siteName}) {
    return CryptoCoinDetailsLoaded(
        coin: coin ?? this.coin,
        selectedItem: selectedItem ?? this.selectedItem,
        counterCoin: counterCoin ?? this.counterCoin,
        price: price ?? this.price,
        max: max ?? this.max,
        min: min ?? this.min,
        sparkLine: sparkLine ?? this.sparkLine,
        dropDownList: dropDownList ?? this.dropDownList,
        currentPriceInUsd: currentPriceInUsd ?? this.currentPriceInUsd,
        coinDetailsPrice: coinDetailsPrice ?? this.coinDetailsPrice,
        inPortfolio: inPortfolio ?? this.inPortfolio,
        siteName: siteName ?? this.siteName);
  }
}

class CryptoCoinDetailsLoading extends CryptoCoinDetailsState {}

class CryptoCoinDetailsFailure extends CryptoCoinDetailsState {
  final Object error;

  const CryptoCoinDetailsFailure({required this.error});
  @override
  List<Object> get props => super.props..add(error);
}
