import 'package:equatable/equatable.dart';

import 'package:crypto_app/repository/crypto_coin/models/crypto_coin_details_in_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin_list.g.dart';

@JsonSerializable()
class CryptoCoinList extends Equatable {
  const CryptoCoinList({
    required this.cryptoCoinList,
  });

  final List<CryptoCoinDetailsInList> cryptoCoinList;

  @override
  List<Object?> get props => [cryptoCoinList];

  factory CryptoCoinList.fromJson(Map<String, dynamic> json) =>
      _$CryptoCoinListFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoCoinListToJson(this);
}
