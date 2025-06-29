import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/social_auth_bloc/social_auth_event.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/social_auth_bloc/social_auth_states.dart';

import '../../../data/repos/auth_repo.dart';

class SocialAuthBloc extends Bloc<SocialAuthEvent, SocialAuthStates> {
  AuthRepo authRepo;

  SocialAuthBloc({required this.authRepo}) : super(SocialAuthInitial()) {
    on<SignInWithGoogleEvent>(_onSignInWithGoogle);
    on<SignInWithGoogleTokenEvent>(_onSignInWithGoogleToken);
  }

  //sign in with google event
  Future<void> _onSignInWithGoogle(
    SignInWithGoogleEvent event,
    Emitter<SocialAuthStates> emit,
  ) async {
    emit(SignInWithGoogleLoading());
    print('Sign in with google loading');
    var result = await authRepo.signInWithGoogle();
    await result.fold(
      (error) async {
        print('Sign in with google failure');
        print('error message : ${error.errorMessage}');
        return emit(
          SignInWithGoogleFailure(
            errorMessage: error.errorMessage ?? 'bloc error',
          ),
        );
      },
      (success) async {
        print('Sign in with google success');
        return emit(SignInWithGoogleSuccess(token: success));
      },
    );
  }

  //sign in with google token event
  Future<void> _onSignInWithGoogleToken(
    SignInWithGoogleTokenEvent event,
    Emitter<SocialAuthStates> emit,
  ) async {
    emit(SignInWithGoogleTokenLoading());
    var result = await authRepo.signInWithGoogleToken(token: event.token);
    await result.fold(
      (error) async {
        return emit(
          SignInWithGoogleFailure(
            errorMessage: error.errorMessage ?? 'bloc error',
          ),
        );
      },
      (success) async {
        return emit(SignInWithGoogleTokenSuccess());
      },
    );
  }
}
