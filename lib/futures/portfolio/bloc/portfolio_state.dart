// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'portfolio_bloc.dart';

sealed class PortfolioState extends Equatable {
  const PortfolioState();

  @override
  List<Object> get props => [];
}

final class PortfolioInitial extends PortfolioState {}

class PortfolioLoaded extends PortfolioState {
  final String portfolioName;
  final List<CoinUserData> portfolioList;

  final double balance;
  final double totalProfitInUsd;
  final double totalProfitPercentage;

  const PortfolioLoaded(
      {required this.portfolioName,
      required this.portfolioList,
      required this.balance,
      required this.totalProfitInUsd,
      required this.totalProfitPercentage});

  @override
  List<Object> get props => super.props
    ..addAll([
      portfolioName,
      portfolioList,
      balance,
      totalProfitInUsd,
      totalProfitPercentage,
    ]);

  PortfolioLoaded copyWith({
    String? portfolioName,
    List<CoinUserData>? portfolioList,
    double? balance,
    double? totalProfitInUsd,
    double? totalProfitPercentage,
  }) {
    return PortfolioLoaded(
        portfolioName: portfolioName ?? this.portfolioName,
        portfolioList: portfolioList ?? this.portfolioList,
        balance: balance ?? this.balance,
        totalProfitInUsd: totalProfitInUsd ?? this.totalProfitInUsd,
        totalProfitPercentage:
            totalProfitPercentage ?? this.totalProfitPercentage);
  }
}

class PortfolioLoading extends PortfolioState {}

class PortfolioFailure extends PortfolioState {
  final Object error;
  const PortfolioFailure({required this.error});

  @override
  List<Object> get props => super.props..add(error);
}
