import 'package:road_man_project/features/_03_auth_view/data/model/user_token_model.dart';

abstract class RefreshTokenStates {}

class RefreshTokenInitial extends RefreshTokenStates {}

class RefreshTokenLoading extends RefreshTokenStates {}

class RefreshTokenFailure extends RefreshTokenStates {
  final String errorMessage;
  RefreshTokenFailure({required this.errorMessage});
}

class RefreshTokenSuccess extends RefreshTokenStates {
  final UserTokensModel userTokensModel;
  RefreshTokenSuccess({required this.userTokensModel});
}
