// import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:crypto_app/futures/settings/bloc/settings_state.dart';
import 'package:crypto_app/repository/auth/abstract_auth_repository.dart';
import 'package:crypto_app/repository/data_storage_repository/abstract_data_storage_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'settings_event.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final AbstractAuthRepository abstractAuthRepository;
  final AbstractDataStorageRepository abstractDataStorageRepository;

  SettingsBloc(this.abstractAuthRepository, this.abstractDataStorageRepository)
      : super(const SettingsState()) {
    on<SettingsEvent>((event, emit) async {
      if (event is SettingsSignOutEvent) {
        await _signOut(event, emit);
      } else if (event is SettingsSwitchOnEvent) {
        await _switchOn(event, emit);
      } else if (event is SettingsSwitchOffEvent) {
        await _switchOff(event, emit);
      } else if (event is SettingsLoadEvent) {
        await _loadSettings(event, emit);
      } else if (event is SettingsLoadUserInfoEvent) {
        await _loadSettingsUserInfo(event, emit);
      } else if (event is SettingsUpdateUserInfo) {
        await _updateUserDate(event, emit);
      } else if (event is SettingsPickImage) {
        await _pickImage(event, emit);
      }
    }, transformer: sequential());
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

    emit(state.copyWith(
      switchValue: switchValuePref,
    ));
  }

  Future<void> _switchOn(
      SettingsSwitchOnEvent event, Emitter<SettingsState> emit) async {
    await abstractDataStorageRepository.setTheme(swithBool: true);
    final switchValuePref = await abstractDataStorageRepository.getTheme();
    emit(state.copyWith(switchValue: switchValuePref));
  }

  Future<void> _loadSettingsUserInfo(
      SettingsLoadUserInfoEvent event, Emitter<SettingsState> emit) async {
    final userInfo = await abstractDataStorageRepository.getUserInfo();
    final newState = state.copyWith(
        charForAvatar: userInfo.username[0].toUpperCase(),
        email: userInfo.email,
        name: userInfo.username,
        image: userInfo.profileImage);

    emit(newState);
  }

  Future<void> _pickImage(
      SettingsPickImage event, Emitter<SettingsState> emit) async {
    // Uint8List images =
    await abstractDataStorageRepository.pickImage(ImageSource.gallery);
    // return images;
    //  final userInfo = await abstractDataStorageRepository.getUserInfo();
    //  final newState = state.copyWith(
    //     charForAvatar: userInfo.username[0].toUpperCase(),

    //     name: userInfo.username,
    //     image: userInfo.profileImage);
  }

  Future<void> _updateUserDate(
      SettingsUpdateUserInfo event, Emitter<SettingsState> emit) async {
    await abstractDataStorageRepository.updateSettingsUsersInfo(
        username: event.username, pathImage: event.profileImage);

    final userInfo = await abstractDataStorageRepository.getUserInfo();
    final newState = state.copyWith(
      charForAvatar: userInfo.username[0].toUpperCase(),
      name: userInfo.username,
      // image: userInfo.profileImage
    );

    emit(newState);
  }

  Future<void> _switchOff(
      SettingsSwitchOffEvent event, Emitter<SettingsState> emit) async {
    await abstractDataStorageRepository.setTheme(swithBool: false);
    final switchValuePref = await abstractDataStorageRepository.getTheme();

    emit(state.copyWith(switchValue: switchValuePref));
  }
}
