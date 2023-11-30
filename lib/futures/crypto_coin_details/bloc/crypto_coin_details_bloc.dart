import 'package:bloc/bloc.dart';
import 'package:crypto_app/repository/abstract_coin_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../repository/crypto_coin/models/crypto_coin_details.dart';

part 'crypto_coin_details_event.dart';
part 'crypto_coin_details_state.dart';

class CryptoCoinDetailsBloc
    extends Bloc<CryptoCoinDetailsEvent, CryptoCoinDetailsState> {
  final AbstractCoinRepository abstractCoinRepository;
  CryptoCoinDetailsBloc(this.abstractCoinRepository)
      : super(CryptoCoinDetailsInitial()) {
    on<CryptoCoinDetailsLoadEvent>(_getCoinDetailsLoad);
  }

  Future<void> _getCoinDetailsLoad(CryptoCoinDetailsLoadEvent event,
      Emitter<CryptoCoinDetailsState> emit) async {
    try {
      if (state is! CryptoCoinDetailsLoaded) {
        emit(CryptoCoinDetailsLoading());
      }
      final coin =
          await abstractCoinRepository.getCryptoCoinDetails(id: event.id);

      emit(CryptoCoinDetailsLoaded(coin: coin));
    } catch (e) {
      emit(CryptoCoinDetailsFailure(error: e));
    }
  }
}
