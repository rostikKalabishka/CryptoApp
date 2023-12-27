import 'package:bloc/bloc.dart';
import 'package:crypto_app/futures/settings/bloc/settings_state.dart';
import 'package:crypto_app/repository/auth/abstract_auth_repository.dart';
import 'package:crypto_app/repository/data_storage_repository/abstract_data_storage_repository.dart';
import 'package:equatable/equatable.dart';

part 'settings_event.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final AbstractAuthRepository abstractAuthRepository;
  final AbstractDataStorageRepository abstractDataStorageRepository;

  SettingsBloc(this.abstractAuthRepository, this.abstractDataStorageRepository)
      : super(const SettingsState()) {
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
    final switchValuePref = await abstractDataStorageRepository.getTheme();

    emit(state.copyWith(switchValue: switchValuePref));
  }

  Future<void> _switchOn(
      SettingsSwitchOnEvent event, Emitter<SettingsState> emit) async {
    await abstractDataStorageRepository.setTheme(swithBool: true);
    final switchValuePref = await abstractDataStorageRepository.getTheme();
    emit(state.copyWith(switchValue: switchValuePref));
    print(state.switchValue.toString());
  }

  Future<void> _switchOff(
      SettingsSwitchOffEvent event, Emitter<SettingsState> emit) async {
    await abstractDataStorageRepository.setTheme(swithBool: false);
    final switchValuePref = await abstractDataStorageRepository.getTheme();
    emit(state.copyWith(switchValue: switchValuePref));
    print(state.switchValue.toString());
  }
}
