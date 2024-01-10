import 'package:bloc/bloc.dart';
import 'package:crypto_app/futures/portfolio/model/coin_user_data.dart';
import 'package:crypto_app/repository/data_storage_repository/abstract_data_storage_repository.dart';
import 'package:equatable/equatable.dart';

part 'portfolio_event.dart';
part 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final AbstractDataStorageRepository abstractDataStorageRepository;
  PortfolioBloc(this.abstractDataStorageRepository)
      : super(PortfolioInitial()) {
    on<PortfolioEvent>((event, emit) async {
      if (event is PortfolioInfoLoadedEvent) {
        await _loadPortfolioInfo(event, emit);
      } else if (event is UpdatePortfolioNameEvent) {
        await _updatePortfolioName(event, emit);
      } else if (event is PortfolioListUpdateEvent) {
        await _updatePortfolioList(event, emit);
      } else if (event is PortfolioAddedCoinEvent) {}
    });
  }

  Future<void> _loadPortfolioInfo(
      PortfolioInfoLoadedEvent event, Emitter<PortfolioState> emit) async {
    try {
      final userInfo = await abstractDataStorageRepository.getUserInfo();
      final List<CoinUserData> portfolioList =
          userInfo.portfolio.map((e) => CoinUserData.fromJson(e)).toList();
      emit(PortfolioLoaded(
          portfolioName: userInfo.portfolioName, portfolioList: portfolioList));
    } catch (e) {
      emit(PortfolioFailure(error: e));
    }
  }

  Future<void> _updatePortfolioList(
      PortfolioListUpdateEvent event, Emitter<PortfolioState> emit) async {
    final newState = state;
    try {
      if (newState is PortfolioLoaded) {
        final updateState = newState;
        final userInfo = await abstractDataStorageRepository.getUserInfo();
        final List<CoinUserData> portfolioList =
            userInfo.portfolio.map((e) => CoinUserData.fromJson(e)).toList();
        emit(updateState.copyWith(portfolioList: portfolioList));
      }
    } catch (e) {
      emit(PortfolioFailure(error: e));
    }
  }

  Future<void> _updatePortfolioName(
      UpdatePortfolioNameEvent event, Emitter<PortfolioState> emit) async {
    final newState = state;
    try {
      if (newState is PortfolioLoaded) {
        final updateState = newState;
        await abstractDataStorageRepository.updatePortfolioName(
            newPortfolioName: event.updatePortfolioName);
        final userInfo = await abstractDataStorageRepository.getUserInfo();
        emit(updateState.copyWith(portfolioName: userInfo.portfolioName));
      }
    } catch (e) {
      emit(PortfolioFailure(error: e));
    }
  }

  Future<void> _addEmountCoin(
      PortfolioAddedCoinEvent event, Emitter<PortfolioState> emit) async {
    final newState = state;
    try {
      if (newState is PortfolioLoaded) {
        final updateState = newState;

        final userInfo = await abstractDataStorageRepository.getUserInfo();

        // emit(updateState.copyWith(portfolioName: userInfo.portfolioName));
      }
    } catch (e) {
      emit(PortfolioFailure(error: e));
    }
  }
}
