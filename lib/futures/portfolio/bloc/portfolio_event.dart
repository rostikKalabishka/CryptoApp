part of 'portfolio_bloc.dart';

sealed class PortfolioEvent extends Equatable {
  const PortfolioEvent();

  @override
  List<Object> get props => [];
}

class PortfolioInfoLoadedEvent extends PortfolioEvent {
  const PortfolioInfoLoadedEvent();
}

class UpdatePortfolioNameEvent extends PortfolioEvent {
  final String updatePortfolioName;
  const UpdatePortfolioNameEvent({required this.updatePortfolioName});
  @override
  List<Object> get props => super.props..add(updatePortfolioName);
}
