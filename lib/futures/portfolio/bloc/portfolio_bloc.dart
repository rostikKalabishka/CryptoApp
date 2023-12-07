import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'portfolio_event.dart';
part 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  PortfolioBloc() : super(PortfolioInitial()) {
    on<PortfolioEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
