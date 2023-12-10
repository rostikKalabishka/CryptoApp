part of 'registration_bloc.dart';

sealed class RegistrationState extends Equatable {
  const RegistrationState();
  
  @override
  List<Object> get props => [];
}

final class RegistrationInitial extends RegistrationState {}
