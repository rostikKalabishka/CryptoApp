import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'crypto_coin_details_in_list.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CryptoCoinDetailsInList extends Equatable {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final int currentPrice;
  final int marketCap;
  final int marketCapRank;
  final int fullyDilutedValuation;
  final int totalVolume;
  @JsonKey(name: 'high_24h')
  final int high24h;
  @JsonKey(name: 'low_24h')
  final int low24h;
  @JsonKey(name: 'price_change_24h')
  final double priceChange24h;

  @JsonKey(name: 'price_change_percentage_24h')
  final double priceChangePercentage24h;

  @JsonKey(name: 'market_cap_change_24h')
  final double marketCapChange24h;

  @JsonKey(name: 'market_cap_change_percentage_24h')
  final double marketCapChangePercentage24h;

  final int circulatingSupply;
  final int totalSupply;
  final int maxSupply;
  final int ath;
  final double athChangePercentage;
  final String athDate;
  final double atl;
  final double atlChangePercentage;
  final String atlDate;
  final String lastUpdated;
  const CryptoCoinDetailsInList({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    required this.fullyDilutedValuation,
    required this.totalVolume,
    required this.high24h,
    required this.low24h,
    required this.priceChange24h,
    required this.priceChangePercentage24h,
    required this.marketCapChange24h,
    required this.marketCapChangePercentage24h,
    required this.circulatingSupply,
    required this.totalSupply,
    required this.maxSupply,
    required this.ath,
    required this.athChangePercentage,
    required this.athDate,
    required this.atl,
    required this.atlChangePercentage,
    required this.atlDate,
    required this.lastUpdated,
  });

  @override
  List<Object?> get props => [
        id,
        symbol,
        name,
        image,
        currentPrice,
        marketCap,
        marketCapRank,
        fullyDilutedValuation,
        totalVolume,
        high24h,
        low24h,
        priceChange24h,
        priceChangePercentage24h,
        marketCapChange24h,
        marketCapChangePercentage24h,
        circulatingSupply,
        totalSupply,
        maxSupply,
        ath,
        athChangePercentage,
        athDate,
        atl,
        atlChangePercentage,
        atlDate,
        lastUpdated
      ];

  factory CryptoCoinDetailsInList.fromJson(Map<String, dynamic> json) =>
      _$CryptoCoinDetailsInListFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoCoinDetailsInListToJson(this);
}
