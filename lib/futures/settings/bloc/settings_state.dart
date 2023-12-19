part of 'settings_bloc.dart';

sealed class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

final class SettingsInitial extends SettingsState {}

final class SettingsLoaded extends SettingsState {}

final class SettingsLoading extends SettingsState {}

final class SettingsFailure extends SettingsState {}

class SettingsSuccess extends SettingsState {}

class SettingsProcess extends SettingsState {}
