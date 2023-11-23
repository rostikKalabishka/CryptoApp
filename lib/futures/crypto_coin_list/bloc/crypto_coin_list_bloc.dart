import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'crypto_coin_list_event.dart';
part 'crypto_coin_list_state.dart';

class CryptoCoinListBloc extends Bloc<CryptoCoinListEvent, CryptoCoinListState> {
  CryptoCoinListBloc() : super(CryptoCoinListInitial()) {
    on<CryptoCoinListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
