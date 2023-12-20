import 'package:bloc/bloc.dart';
import 'package:crypto_app/repository/abstract_auth_repository.dart';
import 'package:equatable/equatable.dart';

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
    emit(RegistrationProcess());
    try {
      await coinRepository.registration(
          username: event.username,
          password: event.password,
          email: event.email);
      emit(RegistrationSuccess());
      // if (state is RegistrationSuccess) {}
    } catch (e) {
      emit(RegistrationFailure(error: e));
    }
  }

  Future<void> _googleRegistration(RegistrationWithGoogleEvent event,
      Emitter<RegistrationState> emit) async {
    emit(RegistrationProcess());
    try {
      await coinRepository.singInWithGoogle();
      emit(RegistrationSuccess());
      // if (state is RegistrationSuccess) {}
    } catch (e) {
      emit(RegistrationFailure(error: e));
    }
  }
}
