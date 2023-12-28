import 'package:equatable/equatable.dart';

class SettingsState extends Equatable {
  const SettingsState(
      {this.switchValue = true,
      this.inProcess = false,
      this.isSuccess = false,
      this.name = '',
      this.email = '',
      this.image = '',
      this.error = ''});
  final bool switchValue;
  final bool inProcess;
  final bool isSuccess;
  final Object error;
  final String name;
  final String email;
  final String image;

  @override
  List<Object> get props =>
      [switchValue, inProcess, isSuccess, name, email, error, image];

  SettingsState copyWith({
    bool? switchValue,
    bool? inProcess,
    bool? isSuccess,
    Object? error,
    String? name,
    String? email,
    String? image,
  }) {
    return SettingsState(
      switchValue: switchValue ?? this.switchValue,
      inProcess: inProcess ?? this.inProcess,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error ?? this.error,
      name: name ?? this.name,
      email: email ?? this.email,
      image: image ?? this.image,
    );
  }
}
