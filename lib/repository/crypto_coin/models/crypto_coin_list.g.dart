// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_coin_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoCoinList _$CryptoCoinListFromJson(Map<String, dynamic> json) =>
    CryptoCoinList(
      cryptoCoinList: (json['cryptoCoinList'] as List<dynamic>)
          .map((e) =>
              CryptoCoinDetailsInList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CryptoCoinListToJson(CryptoCoinList instance) =>
    <String, dynamic>{
      'cryptoCoinList': instance.cryptoCoinList,
    };
