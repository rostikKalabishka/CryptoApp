// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinUserData _$CoinUserDataFromJson(Map<String, dynamic> json) => CoinUserData(
      cryptocurrencyName: json['cryptocurrency_name'] as String,
      priceCurrent: (json['price_current'] as num).toDouble(),
      id: json['id'] as String,
      image: json['image'] as String,
      rank: json['rank'] as int,
      symbol: json['symbol'] as String,
      priceWhichBought: (json['price_which_bought'] as num).toDouble(),
    );

Map<String, dynamic> _$CoinUserDataToJson(CoinUserData instance) =>
    <String, dynamic>{
      'cryptocurrency_name': instance.cryptocurrencyName,
      'price_current': instance.priceCurrent,
      'id': instance.id,
      'image': instance.image,
      'rank': instance.rank,
      'price_which_bought': instance.priceWhichBought,
      'symbol': instance.symbol,
    };
