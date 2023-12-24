part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class SettingsLoadEvent extends SettingsEvent {}

class SettingsSignOutEvent extends SettingsEvent {}

class SettingsSwitchOnEvent extends SettingsEvent {}

class SettingsSwitchOffEvent extends SettingsEvent {}

class SettingsDarkModeEvent extends SettingsEvent {}
