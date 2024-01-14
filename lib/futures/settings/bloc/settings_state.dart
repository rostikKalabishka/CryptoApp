import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class SettingsState extends Equatable {
  const SettingsState(
      {this.switchValue = true,
      this.inProcess = false,
      this.isSuccess = false,
      this.charForAvatar = '',
      this.name = '',
      this.email = '',
      this.image = '',
      this.balance = 0,
      this.selectedImage,
      this.error = ''});
  final bool switchValue;
  final bool inProcess;
  final bool isSuccess;
  final Object error;
  final String name;
  final String email;
  final String image;
  final double balance;
  final String charForAvatar;
  final XFile? selectedImage;

  @override
  List<Object> get props => [
        balance,
        switchValue,
        inProcess,
        isSuccess,
        name,
        email,
        error,
        image,
        charForAvatar,
        selectedImage ?? XFile('')
      ];

  SettingsState copyWith(
      {bool? switchValue,
      bool? inProcess,
      bool? isSuccess,
      Object? error,
      String? name,
      String? email,
      double? balance,
      String? image,
      XFile? selectedImage,
      String? charForAvatar}) {
    return SettingsState(
        balance: balance ?? this.balance,
        selectedImage: selectedImage ?? this.selectedImage,
        switchValue: switchValue ?? this.switchValue,
        inProcess: inProcess ?? this.inProcess,
        isSuccess: isSuccess ?? this.isSuccess,
        error: error ?? this.error,
        name: name ?? this.name,
        email: email ?? this.email,
        image: image ?? this.image,
        charForAvatar: charForAvatar ?? this.charForAvatar);
  }
}
