// ignore_for_file: public_member_api_docs, sort_constructors_first
// part of 'settings_bloc.dart';

// class SettingsState extends Equatable {
//   const SettingsState();

//   @override
//   List<Object> get props => [];
// }

// final class SettingsInitial extends SettingsState {}

// class SettingsLoaded extends SettingsState {
//   final bool switchValue;
//   const SettingsLoaded({required this.switchValue});
//   @override
//   List<Object> get props => super.props..addAll([switchValue]);

//   SettingsLoaded copyWith({
//     bool? switchValue,
//   }) {
//     return SettingsLoaded(
//       switchValue: switchValue ?? this.switchValue,
//     );
//   }
// }

// final class SettingsLoading extends SettingsState {}

// final class SettingsFailure extends SettingsState {
//   final Object error;
//   const SettingsFailure({required this.error});
//   @override
//   List<Object> get props => super.props..addAll([error]);
// }

// class SettingsSuccess extends SettingsState {}

// class SettingsProcess extends SettingsState {}

import 'package:equatable/equatable.dart';

class SettingsState extends Equatable {
  const SettingsState(
      {this.switchValue = true,
      this.inProcess = false,
      this.isSuccess = false,
      this.error});
  final bool switchValue;
  final bool inProcess;
  final bool isSuccess;
  final Object? error;

  @override
  List<Object> get props => [switchValue];

  SettingsState copyWith({
    bool? switchValue,
    bool? inProcess,
    bool? isSuccess,
    Object? error,
  }) {
    return SettingsState(
      switchValue: switchValue ?? this.switchValue,
      inProcess: inProcess ?? this.inProcess,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error ?? this.error,
    );
  }
}
