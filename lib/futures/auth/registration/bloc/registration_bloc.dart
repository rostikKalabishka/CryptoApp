import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:crypto_app/repository/auth/abstract_auth_repository.dart';
import 'package:crypto_app/router/router.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final AbstractAuthRepository coinRepository;

  RegistrationBloc(this.coinRepository) : super(RegistrationInitial()) {
    on<RegistrationBaseEvent>(_baseRegistration);
    on<RegistrationWithGoogleEvent>(_googleRegistration);
  }

  Future<void> _baseRegistration(
      RegistrationBaseEvent event, Emitter<RegistrationState> emit) async {
    final autoRouter = AutoRouter.of(event.context);
    emit(RegistrationProcess());
    try {
      await coinRepository.registration(
          username: event.username,
          password: event.password,
          email: event.email);
      emit(RegistrationSuccess());
      if (state is! RegistrationFailure) {
        autoRouter.pushAndPopUntil(const HomeRoute(),
            predicate: (route) => false);
      }
    } catch (e) {
      emit(RegistrationFailure(error: e));
    }
  }

  Future<void> _googleRegistration(RegistrationWithGoogleEvent event,
      Emitter<RegistrationState> emit) async {
    final autoRouter = AutoRouter.of(event.context);
    emit(RegistrationProcess());
    try {
      await coinRepository.singInWithGoogle();
      emit(RegistrationSuccess());
      if (state is! RegistrationFailure) {
        autoRouter.pushAndPopUntil(const HomeRoute(),
            predicate: (route) => false);
      }
    } catch (e) {
      emit(RegistrationFailure(error: e));
    }
  }
}
