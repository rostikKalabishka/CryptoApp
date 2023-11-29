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
