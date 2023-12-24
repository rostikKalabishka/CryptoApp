import 'package:bloc/bloc.dart';
import 'package:crypto_app/repository/auth/abstract_auth_repository.dart';
import 'package:equatable/equatable.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final AbstractAuthRepository abstractAuthRepository;
  SettingsBloc(this.abstractAuthRepository) : super(const SettingsState()) {
    on<SettingsSignOutEvent>(_signOut);
    on<SettingsSwitchOnEvent>(_switchOn);
    on<SettingsSwitchOffEvent>(_switchOff);
    on<SettingsLoadEvent>(_loadSettings);
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

  Future<void> _loadSettings(
      SettingsLoadEvent event, Emitter<SettingsState> emit) async {
    // final newState = state;
    if (state is SettingsLoaded) {
      emit(const SettingsLoaded(switchValue: true));
    }
  }

  Future<void> _switchOn(
      SettingsSwitchOnEvent event, Emitter<SettingsState> emit) async {
    // final newState = state;
    if (state is SettingsLoaded) {
      emit(const SettingsLoaded(switchValue: true));
    }
  }

  Future<void> _switchOff(
      SettingsSwitchOffEvent event, Emitter<SettingsState> emit) async {
    emit(const SettingsLoaded(switchValue: false));
  }
}
