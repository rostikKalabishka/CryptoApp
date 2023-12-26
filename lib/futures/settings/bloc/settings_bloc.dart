import 'package:bloc/bloc.dart';
import 'package:crypto_app/futures/settings/bloc/settings_state.dart';
import 'package:crypto_app/repository/auth/abstract_auth_repository.dart';
import 'package:equatable/equatable.dart';

part 'settings_event.dart';

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
    emit(state.copyWith(inProcess: true));
    try {
      await abstractAuthRepository.signOut();
      emit(state.copyWith(inProcess: false, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(error: e));
    }
  }

  Future<void> _loadSettings(
      SettingsLoadEvent event, Emitter<SettingsState> emit) async {
    emit(state.copyWith(switchValue: true));
  }

  Future<void> _switchOn(
      SettingsSwitchOnEvent event, Emitter<SettingsState> emit) async {
    // final newState = state;
    // if (newState is SettingsLoaded) {
    // final updateState = newState.copyWith(switchValue: true);
    // emit(const SettingsLoaded(switchValue: true));
    // print(updateState.switchValue.toString());
    emit(state.copyWith(switchValue: true));
    print(state.switchValue.toString());
  }

  Future<void> _switchOff(
      SettingsSwitchOffEvent event, Emitter<SettingsState> emit) async {
    // final newState = state;
    // if (newState is SettingsLoaded) {
    //   final updateState = newState.copyWith(switchValue: false);
    //   emit(const SettingsLoaded(switchValue: false));

    emit(state.copyWith(switchValue: false));
    print(state.switchValue.toString());
  }
}
