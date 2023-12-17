part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

class LoginFailure extends LoginState {
  final Object error;

  const LoginFailure({required this.error});
  @override
  List<Object> get props => super.props..add(error);
}

class LoginInSuccess extends LoginState {}

class LoginInProcess extends LoginState {}
