// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'crypto_coin_details_bloc.dart';

sealed class CryptoCoinDetailsEvent extends Equatable {
  const CryptoCoinDetailsEvent();

  @override
  List<Object> get props => [];
}

class CryptoCoinDetailsLoadEvent extends CryptoCoinDetailsEvent {
  final String id;

  const CryptoCoinDetailsLoadEvent({required this.id});

  @override
  List<Object> get props => super.props..add(id);
}

class CryptoCoinDropDownMenuEvent extends CryptoCoinDetailsEvent {
  const CryptoCoinDropDownMenuEvent();
}

class CryptoCoinConvertCoinToCurrency extends CryptoCoinDetailsEvent {
  // final CurrentPrice currentPrice;
  const CryptoCoinConvertCoinToCurrency(
      // {required this.currentPrice}
      );

  // @override
  // List<Object> get props => super.props..add(currentPrice);
}

class CryptoCoinConvertCurrencyToCoin extends CryptoCoinDetailsEvent {
  const CryptoCoinConvertCurrencyToCoin();
}

class CryptoCoinCurrencySelectedEvent extends CryptoCoinDetailsEvent {
  final String selectedCurrency;

  const CryptoCoinCurrencySelectedEvent({required this.selectedCurrency});

  @override
  List<Object> get props => [selectedCurrency];
}
