import 'package:equatable/equatable.dart';

class CoinUserData extends Equatable {
  final String cryptocurrencyName;
  final double priceCurrent;
  // final String image;
  // final int rank;
  // final double priceWhichBought;
  const CoinUserData({
    required this.cryptocurrencyName,
    required this.priceCurrent,
    // required this.image,
    // required this.rank,
    // required this.priceWhichBought,
  });
  @override
  List<Object?> get props => [
        cryptocurrencyName, priceCurrent,
        // image, rank, priceWhichBought
      ];
}
