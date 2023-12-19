part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class SettingsSignOutEvent extends SettingsEvent {}

class SettingsDarkModeEvent extends SettingsEvent {}
