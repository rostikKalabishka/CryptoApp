part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class SettingsLoadEvent extends SettingsEvent {}

class SettingsLoadUserInfoEvent extends SettingsEvent {}

class SettingsSignOutEvent extends SettingsEvent {}

class SettingsUpdateUserInfo extends SettingsEvent {
  final String username;
  final String profileImage;

  const SettingsUpdateUserInfo(
      {required this.username, required this.profileImage});
  @override
  List<Object> get props => super.props..addAll([username, profileImage]);
}

class SettingsSwitchOnEvent extends SettingsEvent {}

class SettingsPickImage extends SettingsEvent {}

class SettingsSwitchOffEvent extends SettingsEvent {}

class SettingsDarkModeEvent extends SettingsEvent {}
