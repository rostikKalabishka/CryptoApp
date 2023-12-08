import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'trending_coin.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TrendingCoin extends Equatable {
  final String id;
  final String name;
  final String symbol;
  final int? marketCapRank;
  final String thumb;
  final String large;
  final String small;

  const TrendingCoin(
      {required this.id,
      required this.name,
      required this.symbol,
      required this.marketCapRank,
      required this.thumb,
      required this.large,
      required this.small});
  @override
  List<Object?> get props =>
      [id, name, symbol, marketCapRank, thumb, large, small];

  factory TrendingCoin.fromJson(Map<String, dynamic> json) =>
      _$TrendingCoinFromJson(json);

  Map<String, dynamic> toJson() => _$TrendingCoinToJson(this);
}
