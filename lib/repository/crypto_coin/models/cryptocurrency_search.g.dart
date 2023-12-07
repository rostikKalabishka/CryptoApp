// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cryptocurrency_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptocurrencySearchCoin _$CryptocurrencySearchCoinFromJson(
        Map<String, dynamic> json) =>
    CryptocurrencySearchCoin(
      id: json['id'] as String,
      name: json['name'] as String,
      apiSymbol: json['api_symbol'] as String,
      symbol: json['symbol'] as String,
      marketCapRank: json['market_cap_rank'] as int,
      thumb: json['thumb'] as String,
      large: json['large'] as String,
    );

Map<String, dynamic> _$CryptocurrencySearchCoinToJson(
        CryptocurrencySearchCoin instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'api_symbol': instance.apiSymbol,
      'symbol': instance.symbol,
      'market_cap_rank': instance.marketCapRank,
      'thumb': instance.thumb,
      'large': instance.large,
    };
