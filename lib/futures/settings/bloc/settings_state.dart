part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

final class SettingsInitial extends SettingsState {}

class SettingsLoaded extends SettingsState {
  final bool switchValue;
  const SettingsLoaded({required this.switchValue});
  @override
  List<Object> get props => super.props..addAll([switchValue]);
}

final class SettingsLoading extends SettingsState {}

final class SettingsFailure extends SettingsState {}

class SettingsSuccess extends SettingsState {}

class SettingsProcess extends SettingsState {}
