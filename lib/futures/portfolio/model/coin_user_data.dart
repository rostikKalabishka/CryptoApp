// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coin_user_data.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CoinUserData extends Equatable {
  final String cryptocurrencyName;
  final double priceCurrent;
  final String id;
  final String image;
  final double amountCoins;
  final int rank;
  final double priceWhichBought;
  final double coinInUsd;
  final String symbol;
  const CoinUserData(
      {required this.amountCoins,
      required this.cryptocurrencyName,
      required this.priceCurrent,
      required this.id,
      required this.image,
      required this.rank,
      required this.symbol,
      required this.priceWhichBought,
      required this.coinInUsd,
      r});
  @override
  List<Object?> get props => [
        cryptocurrencyName,
        priceCurrent,
        image,
        rank,
        priceWhichBought,
        id,
        amountCoins,
        coinInUsd
      ];

  factory CoinUserData.fromJson(Map<String, dynamic> json) =>
      _$CoinUserDataFromJson(json);

  Map<String, dynamic> toJson() => _$CoinUserDataToJson(this);

  CoinUserData copyWith(
      {String? cryptocurrencyName,
      double? priceCurrent,
      String? id,
      String? image,
      double? amountCoins,
      int? rank,
      double? priceWhichBought,
      String? symbol,
      double? coinInUsd}) {
    return CoinUserData(
      coinInUsd: coinInUsd ?? this.coinInUsd,
      cryptocurrencyName: cryptocurrencyName ?? this.cryptocurrencyName,
      priceCurrent: priceCurrent ?? this.priceCurrent,
      id: id ?? this.id,
      image: image ?? this.image,
      amountCoins: amountCoins ?? this.amountCoins,
      rank: rank ?? this.rank,
      priceWhichBought: priceWhichBought ?? this.priceWhichBought,
      symbol: symbol ?? this.symbol,
    );
  }
}
