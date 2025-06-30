import 'package:road_man_project/features/_03_auth_view/data/model/sign_in_with_google_get_model.dart';

abstract class SocialAuthStates {}

class SocialAuthInitial extends SocialAuthStates {}

//Sign In  With Google States
class SignInWithGoogleInitial extends SocialAuthStates {}

class SignInWithGoogleFailure extends SocialAuthStates {
  final String errorMessage;
  SignInWithGoogleFailure({required this.errorMessage});
}

class SignInWithGoogleLoading extends SocialAuthStates {}

class SignInWithGoogleSuccess extends SocialAuthStates {
  final String token;
  SignInWithGoogleSuccess({required this.token});
}

//Sign In  With Google Token States
class SignInWithGoogleTokenInitial extends SocialAuthStates {}

class SignInWithGoogleTokenFailure extends SocialAuthStates {
  final String errorMessage;
  SignInWithGoogleTokenFailure({required this.errorMessage});
}

class SignInWithGoogleTokenLoading extends SocialAuthStates {}

class SignInWithGoogleTokenSuccess extends SocialAuthStates {
  final SignInWithGoogleGetModel signInWithGoogleGetModel;
  SignInWithGoogleTokenSuccess({required this.signInWithGoogleGetModel});
}
