part of 'portfolio_bloc.dart';

sealed class PortfolioState extends Equatable {
  const PortfolioState();
  
  @override
  List<Object> get props => [];
}

final class PortfolioInitial extends PortfolioState {}
