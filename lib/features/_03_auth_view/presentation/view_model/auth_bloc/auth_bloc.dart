// auth_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/features/_03_auth_view/data/repos/auth_repo.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_event.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthStates> {
  final AuthRepo authRepo;

  AuthBloc({required this.authRepo}) : super(AuthInitial()) {
    on<SignUpEvent>(_onSignUpEvent);
    on<SignInEvent>(_onSignInEvent);
    on<ForgetPasswordEvent>(_onForgetPasswordEvent);
    on<VerifyOtpEvent>(_onVerifyOtpEvent);
    on<VerifyEmailEvent>(_onVerifyEmailEvent);
    on<SendAgainVerifyEmailEvent>(_onSendAgainVerifyEmail);
    on<ResetPasswordEvent>(_onResetPasswordEvent);
  }

  Future<void> _onSignUpEvent(
    SignUpEvent event,
    Emitter<AuthStates> emit,
  ) async {
    emit(SignUpLoading());
    var result = await authRepo.signUp(
      name: event.name,
      email: event.email,
      password: event.password,
    );
    await result.fold(
      (error) async =>
          emit(SignUpFailure(errorMessage: error.errorMessage ?? 'bloc error')),
      (success) async => emit(
        SignUpSuccess(
          name: event.name,
          email: event.email,
          password: event.password,
        ),
      ),
    );
  }

  Future<void> _onSignInEvent(
    SignInEvent event,
    Emitter<AuthStates> emit,
  ) async {
    emit(SignInLoading());
    var result = await authRepo.signIn(
      email: event.email,
      password: event.password,
    );
    await result.fold(
      (error) async =>
          emit(SignInFailure(errorMessage: error.errorMessage ?? 'bloc error')),
      (userToken) async {
        emit(SignInSuccess(email: event.email, password: event.password));
      },
    );
  }

  Future<void> _onForgetPasswordEvent(
    ForgetPasswordEvent event,
    Emitter<AuthStates> emit,
  ) async {
    emit(ForgetPasswordLoading());
    var result = await authRepo.forgetPassword(email: event.email);
    await result.fold(
      (error) async => emit(
        ForgetPasswordFailure(errorMessage: error.errorMessage ?? 'bloc error'),
      ),
      (success) async => emit(ForgetPasswordSuccess(email: event.email)),
    );
  }

  Future<void> _onVerifyOtpEvent(
    VerifyOtpEvent event,
    Emitter<AuthStates> emit,
  ) async {
    emit(VerificationOtpLoading());
    var result = await authRepo.verificationOtp(
      email: event.email,
      otp: event.otp,
    );
    await result.fold(
      (error) async => emit(
        VerificationOtpFailure(
          errorMessage: error.errorMessage ?? 'bloc error',
        ),
      ),
      (success) async =>
          emit(VerificationOtpSuccess(email: event.email, otp: event.otp)),
    );
  }

  Future<void> _onVerifyEmailEvent(
    VerifyEmailEvent event,
    Emitter<AuthStates> emit,
  ) async {
    emit(VerificationEmailLoading());
    var result = await authRepo.verificationEmail(
      email: event.email,
      otp: event.otp,
    );
    await result.fold(
      (error) async => emit(
        VerificationEmailFailure(
          errorMessage: error.errorMessage ?? 'bloc error',
        ),
      ),
      (success) async =>
          emit(VerificationEmailSuccess(email: event.email, otp: event.otp)),
    );
  }

  Future<void> _onSendAgainVerifyEmail(
    SendAgainVerifyEmailEvent event,
    Emitter<AuthStates> emit,
  ) async {
    emit(SendAgainVerificationLoading());
    var result = await authRepo.sendAgainVerificationEmail(
      email: event.email,
      otp: event.otp,
    );
    await result.fold(
      (error) async => emit(
        SendAgainVerificationFailure(
          errorMessage: error.errorMessage ?? 'bloc error',
        ),
      ),
      (success) async => emit(
        SendAgainVerificationSuccess(email: event.email, otp: event.otp),
      ),
    );
  }

  Future<void> _onResetPasswordEvent(
    ResetPasswordEvent event,
    Emitter<AuthStates> emit,
  ) async {
    emit(ResetPasswordLoading());
    var result = await authRepo.resetPassword(
      otp: event.otp,
      email: event.email,
      newPassword: event.newPassword,
      confirmPassword: event.confirmPassword,
    );
    await result.fold(
      (error) async => emit(
        ResetPasswordFailure(errorMessage: error.errorMessage ?? 'bloc error'),
      ),
      (success) async => emit(
        ResetPasswordSuccess(
          email: event.email,
          otp: event.otp,
          newPassword: event.newPassword,
          confirmPassword: event.confirmPassword,
        ),
      ),
    );
  }
}
