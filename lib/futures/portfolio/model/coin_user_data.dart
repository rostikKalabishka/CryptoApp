import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'coin_user_data.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CoinUserData extends Equatable {
  final String cryptocurrencyName;
  final double priceCurrent;
  final String id;
  final String image;
  final int rank;
  final double priceWhichBought;
  final String symbol;
  const CoinUserData({
    required this.cryptocurrencyName,
    required this.priceCurrent,
    required this.id,
    required this.image,
    required this.rank,
    required this.symbol,
    required this.priceWhichBought,
  });
  @override
  List<Object?> get props =>
      [cryptocurrencyName, priceCurrent, image, rank, priceWhichBought, id];

  factory CoinUserData.fromJson(Map<String, dynamic> json) =>
      _$CoinUserDataFromJson(json);

  Map<String, dynamic> toJson() => _$CoinUserDataToJson(this);
}
