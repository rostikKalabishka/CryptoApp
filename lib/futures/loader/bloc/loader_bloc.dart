import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_app/repository/auth/abstract_auth_repository.dart';

import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';

part 'loader_event.dart';
part 'loader_state.dart';

class LoaderBloc extends Bloc<LoaderEvent, LoaderBlocState> {
  final AbstractAuthRepository abstractAuthRepository;

  LoaderBloc(this.abstractAuthRepository) : super(LoaderBlocState.unknown) {
    on<LoadPage>(_loadPage);
  }

  Future<void> _loadPage(LoadPage event, Emitter<LoaderBlocState> emit) async {
    try {
      await for (var user in abstractAuthRepository.user) {
        if (user != null) {
          emit(LoaderBlocState.authorize);
        } else {
          emit(LoaderBlocState.notAuthorize);
        }
      }
    } catch (e) {
      emit(LoaderBlocState.notAuthorize);
    }
  }
}
