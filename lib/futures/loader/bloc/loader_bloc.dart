import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:crypto_app/repository/auth/abstract_auth_repository.dart';
import 'package:crypto_app/router/router.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'loader_event.dart';
part 'loader_state.dart';

class LoaderBloc extends Bloc<LoaderEvent, LoaderState> {
  final AbstractAuthRepository abstractAuthRepository;
  late final StreamSubscription<User?> _userSubscription;
  LoaderBloc(this.abstractAuthRepository) : super(LoaderInitial()) {
    on<LoadPage>(_loadPage);
  }

  Future<void> _loadPage(LoadPage event, Emitter<LoaderState> emit) async {
    final autoRouter = AutoRouter.of(event.context);
    try {
      _userSubscription = abstractAuthRepository.user.listen((user) {
        if (user != null) {
          emit(LoadUserAuthLoader(user: user));
          autoRouter.pushAndPopUntil(const HomeRoute(),
              predicate: (route) => false);
        } else {
          autoRouter.pushAndPopUntil(const LoginRoute(),
              predicate: (route) => false);
        }
      });
    } catch (e) {
      emit(LoaderFailure(error: e));
    }
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
