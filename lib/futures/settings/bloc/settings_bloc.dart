import 'package:bloc/bloc.dart';
import 'package:crypto_app/repository/auth/abstract_auth_repository.dart';
import 'package:equatable/equatable.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final AbstractAuthRepository abstractAuthRepository;
  SettingsBloc(this.abstractAuthRepository) : super(SettingsInitial()) {
    on<SettingsSignOutEvent>(_signOut);
  }

  Future<void> _signOut(
      SettingsSignOutEvent event, Emitter<SettingsState> emit) async {
    emit(SettingsProcess());
    try {
      await abstractAuthRepository.signOut();
      emit(SettingsSuccess());
    } catch (e) {
      emit(SettingsFailure());
    }
  }
}
