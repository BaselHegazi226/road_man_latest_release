import 'package:road_man_project/features/_09_profile_view/data/models/update_profile_model/update_profile_get_model.dart';

abstract class ProfileStates {}

class ProfileInitial extends ProfileStates {}

//update profile states
class UpdateProfileInitialState extends ProfileStates {}

class UpdateProfileFailureState extends ProfileStates {
  final String errorMessage;
  UpdateProfileFailureState({required this.errorMessage});
}

class UpdateProfileLoadingState extends ProfileStates {}

class UpdateProfileSuccessState extends ProfileStates {
  final UpdateProfileGetModel updateProfileGetModel;
  UpdateProfileSuccessState({required this.updateProfileGetModel});
}

//change password states
class ChangePasswordInitialState extends ProfileStates {}

class ChangePasswordFailureState extends ProfileStates {
  final String errorMessage;
  ChangePasswordFailureState({required this.errorMessage});
}

class ChangePasswordLoadingState extends ProfileStates {}

class ChangePasswordSuccessState extends ProfileStates {}

//Sign OUt States
class LogOutInitial extends ProfileStates {}

class LogOutFailure extends ProfileStates {
  final String errorMessage;
  LogOutFailure({required this.errorMessage});
}

class LogOutLoading extends ProfileStates {}

class LogOutSuccess extends ProfileStates {}
