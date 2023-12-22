import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:crypto_app/repository/auth/abstract_auth_repository.dart';
import 'package:crypto_app/router/router.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AbstractAuthRepository coinRepository;

  LoginBloc(this.coinRepository) : super(LoginInitial()) {
    on<LoginSignInEvent>(_loginSignIn);
    on<LoginSignInWithGoogleEvent>(_loginWithGoogle);
  }

  Future<void> _loginSignIn(
      LoginSignInEvent event, Emitter<LoginState> emit) async {
    final autoRouter = AutoRouter.of(event.context);
    emit(LoginInProcess());
    try {
      await coinRepository.login(
          password: event.password.trim(), email: event.email.trim());
      emit(LoginInSuccess());

      if (state is! LoginFailure) {
        autoRouter.pushAndPopUntil(const HomeRoute(),
            predicate: (route) => false);
      }
    } catch (e) {
      emit(LoginFailure(error: e));
    }
  }

  Future _loginWithGoogle(
      LoginSignInWithGoogleEvent event, Emitter<LoginState> emit) async {
    final autoRouter = AutoRouter.of(event.context);
    emit(LoginInProcess());
    try {
      await coinRepository.singInWithGoogle();
      emit(LoginInSuccess());
      if (state is! LoginFailure) {
        autoRouter.pushAndPopUntil(const HomeRoute(),
            predicate: (route) => false);
      }
    } catch (e) {
      emit(LoginFailure(error: e));
    }
  }
}
