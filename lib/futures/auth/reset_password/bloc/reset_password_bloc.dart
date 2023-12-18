import 'package:bloc/bloc.dart';
import 'package:crypto_app/repository/abstract_auth_repository.dart';
import 'package:equatable/equatable.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final AbstractAuthRepository abstractAuthRepository;
  ResetPasswordBloc(this.abstractAuthRepository)
      : super(ResetPasswordInitial()) {
    on<ForgotPasswordEvent>(_resetPassword);
  }
  Future<void> _resetPassword(
      ForgotPasswordEvent event, Emitter<ResetPasswordState> emit) async {
    emit(ResetPasswordInProcess());
    try {
      await abstractAuthRepository.forgotPassword(
          email: event.emailForResetPassword);
      emit(ResetPasswordInSuccess());
    } catch (e) {
      emit(ResetPasswordFailure(error: e));
    }
  }
}
