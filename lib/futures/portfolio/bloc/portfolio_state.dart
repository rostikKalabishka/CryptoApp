part of 'portfolio_bloc.dart';

sealed class PortfolioState extends Equatable {
  const PortfolioState();

  @override
  List<Object> get props => [];
}

final class PortfolioInitial extends PortfolioState {}

class PortfolioLoaded extends PortfolioState {}

class PortfolioLoading extends PortfolioState {}

class PortfolioFailure extends PortfolioState {
  final Object error;
  const PortfolioFailure({required this.error});

  @override
  List<Object> get props => super.props..add(error);
}
