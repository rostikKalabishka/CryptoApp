part of 'reset_password_bloc.dart';

sealed class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object> get props => [];
}

final class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordInSuccess extends ResetPasswordState {}

class ResetPasswordInProcess extends ResetPasswordState {}

class ResetPasswordFailure extends ResetPasswordState {
  final Object error;

  const ResetPasswordFailure({required this.error});

  @override
  List<Object> get props => super.props..add(error);
}
