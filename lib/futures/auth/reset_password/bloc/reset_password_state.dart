part of 'reset_password_bloc.dart';

sealed class ResetPasswordState extends Equatable {
  const ResetPasswordState();
  
  @override
  List<Object> get props => [];
}

final class ResetPasswordInitial extends ResetPasswordState {}
