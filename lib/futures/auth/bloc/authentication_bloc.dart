import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_app/repository/abstract_auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AbstractAuthRepository abstractAuthRepository;
  late final StreamSubscription<User?> _userSubscription;

  AuthenticationBloc({required this.abstractAuthRepository})
      : super(const AuthenticationState.unknown()) {
    _userSubscription = abstractAuthRepository.user.listen((user) {
      add(AuthenticationUserChanged(user));
    });
    on<AuthenticationUserChanged>((event, emit) {
      if (event.user != null) {
        emit(AuthenticationState.authenticated(event.user!));
      } else {
        emit(const AuthenticationState.unauthenticated());
      }
    });
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
