import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cryptocurrency_search.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CryptocurrencySearchCoin extends Equatable {
  final String id;
  final String name;
  final String apiSymbol;
  final String symbol;
  final int marketCapRank;
  final String thumb;
  final String large;

  const CryptocurrencySearchCoin(
      {required this.id,
      required this.name,
      required this.apiSymbol,
      required this.symbol,
      required this.marketCapRank,
      required this.thumb,
      required this.large});

  @override
  List<Object?> get props =>
      [id, name, apiSymbol, symbol, marketCapRank, thumb, large];

  factory CryptocurrencySearchCoin.fromJson(Map<String, dynamic> json) =>
      _$CryptocurrencySearchCoinFromJson(json);

  Map<String, dynamic> toJson() => _$CryptocurrencySearchCoinToJson(this);
}
