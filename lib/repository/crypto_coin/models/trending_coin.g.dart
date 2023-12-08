// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_coin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendingCoin _$TrendingCoinFromJson(Map<String, dynamic> json) => TrendingCoin(
      id: json['id'] as String,
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      marketCapRank: json['market_cap_rank'] as int?,
      thumb: json['thumb'] as String,
      large: json['large'] as String,
      small: json['small'] as String,
    );

Map<String, dynamic> _$TrendingCoinToJson(TrendingCoin instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'market_cap_rank': instance.marketCapRank,
      'thumb': instance.thumb,
      'large': instance.large,
      'small': instance.small,
    };
