import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'crypto_coin_details_event.dart';
part 'crypto_coin_details_state.dart';

class CryptoCoinDetailsBloc extends Bloc<CryptoCoinDetailsEvent, CryptoCoinDetailsState> {
  CryptoCoinDetailsBloc() : super(CryptoCoinDetailsInitial()) {
    on<CryptoCoinDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
