//Get User Info states
import '../../../data/models/update_profile_model/user_info_model.dart';
import '../profile_blocs/profile_state.dart';

class GetUserInfoInitialState extends ProfileStates {}

class GetUserInfoFailureState extends ProfileStates {
  final String errorMessage;
  GetUserInfoFailureState({required this.errorMessage});
}

class GetUserInfoLoadingState extends ProfileStates {}

class GetUserInfoSuccessState extends ProfileStates {
  final UserInfoModel userInfoModel;
  GetUserInfoSuccessState({required this.userInfoModel});
}

//local states

class GetUserInfoLocalSuccessState extends ProfileStates {
  final UserInfoModel userInfoModel;
  GetUserInfoLocalSuccessState({required this.userInfoModel});
}
