abstract class SocialAuthEvent {}

class SignInWithGoogleEvent extends SocialAuthEvent {}

class SignInWithGoogleTokenEvent extends SocialAuthEvent {
  final String token;
  SignInWithGoogleTokenEvent({required this.token});
}
