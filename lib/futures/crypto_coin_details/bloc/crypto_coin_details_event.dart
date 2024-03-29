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

class CryptoCoinAddToPortfolio extends CryptoCoinDetailsEvent {}

class CryptoCoinRemoveFromPortfolio extends CryptoCoinDetailsEvent {}

class CryptoCoinConvertCoinToCurrencyEvent extends CryptoCoinDetailsEvent {
  final String coinCount;
  final String price;
  const CryptoCoinConvertCoinToCurrencyEvent({
    required this.coinCount,
    required this.price,
  });
  @override
  List<Object> get props => super.props..add(coinCount);
}

class CryptoCoinConvertCurrencyToCoinEvent extends CryptoCoinDetailsEvent {
  const CryptoCoinConvertCurrencyToCoinEvent();
}

class CryptoCoinSaveValueInTextFieldEvent extends CryptoCoinDetailsEvent {
  final String saveValue;
  final String coinCountTwo;
  const CryptoCoinSaveValueInTextFieldEvent({
    required this.saveValue,
    required this.coinCountTwo,
  });
  @override
  List<Object> get props => super.props..addAll([saveValue, coinCountTwo]);
}

class CryptoCoinOpenURL extends CryptoCoinDetailsEvent {
  final String url;
  const CryptoCoinOpenURL({required this.url});
  @override
  List<Object> get props => super.props..addAll([url]);
}

class CryptoCoinCurrencySelectedEvent extends CryptoCoinDetailsEvent {
  final String selectedCurrency;

  const CryptoCoinCurrencySelectedEvent({required this.selectedCurrency});

  @override
  List<Object> get props => super.props..add(selectedCurrency);
}
