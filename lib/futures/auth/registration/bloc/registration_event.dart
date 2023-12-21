part of 'registration_bloc.dart';

sealed class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class RegistrationBaseEvent extends RegistrationEvent {
  final String email;
  final String password;
  final String confirmPassword;
  final String username;
  final BuildContext context;

  const RegistrationBaseEvent(
      {required this.email,
      required this.context,
      required this.password,
      required this.confirmPassword,
      required this.username});
  @override
  List<Object> get props => [email, password, confirmPassword, username];
}

class RegistrationWithGoogleEvent extends RegistrationEvent {
  final BuildContext context;
  const RegistrationWithGoogleEvent({required this.context});
  @override
  List<Object> get props => [context];
}

class RegistrationWithAppleIdEvent extends RegistrationEvent {
  const RegistrationWithAppleIdEvent();
}
