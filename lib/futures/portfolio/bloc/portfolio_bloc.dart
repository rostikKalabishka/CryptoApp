import 'package:bloc/bloc.dart';
import 'package:crypto_app/futures/portfolio/model/coin_user_data.dart';
import 'package:crypto_app/repository/crypto_coin/abstract_coin_repository.dart';
import 'package:crypto_app/repository/crypto_coin/models/model.dart';

import 'package:crypto_app/repository/data_storage_repository/abstract_data_storage_repository.dart';
import 'package:equatable/equatable.dart';

part 'portfolio_event.dart';
part 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final AbstractDataStorageRepository abstractDataStorageRepository;
  final AbstractCoinRepository abstractCoinRepository;
  PortfolioBloc(this.abstractDataStorageRepository, this.abstractCoinRepository)
      : super(PortfolioInitial()) {
    on<PortfolioEvent>((event, emit) async {
      if (event is PortfolioInfoLoadedEvent) {
        await _loadPortfolioInfo(event, emit);
      } else if (event is UpdatePortfolioNameEvent) {
        await _updatePortfolioName(event, emit);
      } else if (event is PortfolioListUpdateEvent) {
        await _updatePortfolioList(event, emit);
      } else if (event is PortfolioAddedCoinEvent) {
        await _addAmountCoins(event, emit);
      }
    });
  }

  Future<void> _loadPortfolioInfo(
      PortfolioInfoLoadedEvent event, Emitter<PortfolioState> emit) async {
    try {
      final userInfo = await abstractDataStorageRepository.getUserInfo();
      final List<CoinUserData> portfolioList =
          userInfo.portfolio.map((e) => CoinUserData.fromJson(e)).toList();
      final double balance = portfolioList.fold(
        0,
        (value, element) => value + element.coinInUsd,
      );
      final double currentPrice = portfolioList.fold(
        0,
        (value, element) =>
            value + (element.priceCurrent * element.amountCoins),
      );
      final double priceBuy = portfolioList.fold(
        0,
        (value, element) =>
            value + (element.priceWhichBought * element.amountCoins),
      );
      final double totalProfitInUsd = currentPrice - priceBuy;
      final double totalProfitPercentage = (currentPrice / priceBuy) - 1;

      emit(PortfolioLoaded(
          portfolioName: userInfo.portfolioName,
          portfolioList: portfolioList,
          balance: balance,
          totalProfitInUsd: totalProfitInUsd,
          totalProfitPercentage: totalProfitPercentage));
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
        late List<CoinUserData> res;
        await Future.forEach(portfolioList, (e) async {
          final CryptoCoinDetails coin =
              await abstractCoinRepository.getCryptoCoinDetails(id: e.id);
          final double currentPrice = coin.marketData.currentPrice.usd;
          final double coinInUsd = e.amountCoins * currentPrice;
          await abstractDataStorageRepository.updateCurrentPriceCoin(
              id: e.id, coinInUSD: coinInUsd, currentPrice: currentPrice);

          final updatedUserInfo =
              await abstractDataStorageRepository.getUserInfo();
          final updatedPortfolioList = updatedUserInfo.portfolio
              .map((e) => CoinUserData.fromJson(e))
              .toList();
          res = List.from(updatedPortfolioList);
        });

        emit(updateState.copyWith(portfolioList: res));
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

  Future<void> _addAmountCoins(
      PortfolioAddedCoinEvent event, Emitter<PortfolioState> emit) async {
    final newState = state;
    try {
      if (newState is PortfolioLoaded) {
        final updateState = newState;

        final userInfo = await abstractDataStorageRepository.getUserInfo();

        final List<CoinUserData> portfolioList =
            userInfo.portfolio.map((e) => CoinUserData.fromJson(e)).toList();
        double amountCoins = 0;
        double coinInUSD = 0;

        CoinUserData updatedCoin = portfolioList.firstWhere((element) {
          if (element.id == event.id) {
            amountCoins = element.amountCoins + double.parse(event.amountCoins);
            coinInUSD = amountCoins * element.priceWhichBought;
            return true;
          }
          return false;
        });

        await abstractDataStorageRepository.updateCurrentCoinInPortfolio(
          id: event.id,
          amountCoins: amountCoins,
          coinInUSD: coinInUSD,
        );
        updatedCoin = updatedCoin.copyWith(
          amountCoins: amountCoins,
          coinInUsd: coinInUSD,
        );
        await abstractDataStorageRepository.updateCurrentCoinInPortfolio(
          id: event.id,
          amountCoins: amountCoins,
          coinInUSD: coinInUSD,
        );

        emit(updateState.copyWith(portfolioList: portfolioList));
      }
    } catch (e) {
      emit(PortfolioFailure(error: e));
    }
  }
}
