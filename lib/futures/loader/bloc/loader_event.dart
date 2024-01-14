part of 'loader_bloc.dart';

sealed class LoaderEvent extends Equatable {
  const LoaderEvent();

  @override
  List<Object> get props => [];
}

class LoadPage extends LoaderEvent {}
