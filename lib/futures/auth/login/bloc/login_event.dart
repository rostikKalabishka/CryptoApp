part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginSignInEvent extends LoginEvent {
  final String email;
  final String password;
  final BuildContext context;

  const LoginSignInEvent({
    required this.email,
    required this.password,
    required this.context,
  });

  @override
  List<Object> get props => [email, password, context];
}

class LoginSignInWithGoogleEvent extends LoginEvent {
  final BuildContext context;

  const LoginSignInWithGoogleEvent({required this.context});
}
