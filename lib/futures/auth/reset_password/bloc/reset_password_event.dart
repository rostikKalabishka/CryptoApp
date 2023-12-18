part of 'reset_password_bloc.dart';

sealed class ResetPasswordEvent extends Equatable {
  const ResetPasswordEvent();

  @override
  List<Object> get props => [];
}

class ForgotPasswordEvent extends ResetPasswordEvent {
  final String emailForResetPassword;

  const ForgotPasswordEvent({required this.emailForResetPassword});
  @override
  List<Object> get props => super.props..add(emailForResetPassword);
}
