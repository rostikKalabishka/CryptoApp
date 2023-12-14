import 'package:equatable/equatable.dart';

class CoinUserData extends Equatable {
  final String cryptocurrency;
  final double priceCurrent;
  const CoinUserData({
    required this.cryptocurrency,
    required this.priceCurrent,
  });
  @override
  List<Object?> get props => [cryptocurrency, priceCurrent];
}
