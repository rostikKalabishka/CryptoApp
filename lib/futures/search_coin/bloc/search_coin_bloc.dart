import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_coin_event.dart';
part 'search_coin_state.dart';

class SearchCoinBloc extends Bloc<SearchCoinEvent, SearchCoinState> {
  SearchCoinBloc() : super(SearchCoinInitial()) {
    on<SearchCoinEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
