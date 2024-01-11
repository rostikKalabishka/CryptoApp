part of 'loader_bloc.dart';

sealed class LoaderEvent extends Equatable {
  const LoaderEvent();

  @override
  List<Object> get props => [];
}

class LoadPage extends LoaderEvent {
  final BuildContext context;

  const LoadPage({required this.context});
  @override
  List<Object> get props => super.props..add(context);
}

// class LoadHomePage extends LoaderEvent {
//   final BuildContext context;

//   const LoadHomePage({required this.context});
//   @override
//   List<Object> get props => super.props..add(context);
// }
