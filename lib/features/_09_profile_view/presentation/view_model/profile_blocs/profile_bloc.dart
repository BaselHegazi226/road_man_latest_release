// ✅ PROFILE BLOC مع تعديل إرسال الصورة كـ base64
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/features/_09_profile_view/data/models/update_profile_model/update_profile_get_model.dart';
import 'package:road_man_project/features/_09_profile_view/data/repos/profile_repos/profile_repos.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/profile_blocs/profile_event.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/profile_blocs/profile_state.dart';

import '../../../../../core/manager/user_info_manager.dart';
import '../../../data/models/update_profile_model/user_info_model.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileStates> {
  final ProfileRepos profileRepos;
  ProfileBloc({required this.profileRepos}) : super(ProfileInitial()) {
    on<UpdateProfileEvent>(_onUpdateProfileEvent);
    on<ChangePasswordEvent>(_onChangePasswordEvent);
    on<LogOutEvent>(_onLogOutEvent);
  }

  Future<void> _onUpdateProfileEvent(
    UpdateProfileEvent event,
    Emitter<ProfileStates> emit,
  ) async {
    emit(UpdateProfileLoadingState());

    // 📌 لو الصورة جايه من UI كـ base64، استخدمها مباشرة
    final result = await profileRepos.updateProfile(
      name: event.name,
      photo: event.photoFile ?? File(''),
      dateOfBirth: event.dateOfBirth,
    );

    await result.fold(
      (error) async {
        emit(
          UpdateProfileFailureState(
            errorMessage: error.errorMessage ?? 'UnKnown error',
          ),
        );
      },
      (success) async {
        // ✅ أضف السطرين هنا
        final userInfo = UserInfoModel.fromJson(success);
        await UserInfoStorageHelper.saveUserInfo(userInfo);

        emit(
          UpdateProfileSuccessState(
            updateProfileGetModel: UpdateProfileGetModel.fromJson(success),
          ),
        );
      },
    );
  }

  Future<void> _onChangePasswordEvent(
    ChangePasswordEvent event,
    Emitter<ProfileStates> emit,
  ) async {
    emit(ChangePasswordLoadingState());
    final result = await profileRepos.changePassword(
      oldPassword: event.oldPassword,
      newPassword: event.newPassword,
      confirmPassword: event.confirmPassword,
    );
    await result.fold(
      (error) async {
        emit(
          ChangePasswordFailureState(
            errorMessage: error.errorMessage ?? 'UnKnown error',
          ),
        );
      },
      (success) async {
        emit(ChangePasswordSuccessState());
      },
    );
  }

  Future<void> _onLogOutEvent(
    LogOutEvent event,
    Emitter<ProfileStates> emit,
  ) async {
    emit(LogOutLoading());
    final result = await profileRepos.logOut();
    await result.fold(
      (error) async {
        emit(
          LogOutFailure(errorMessage: error.errorMessage ?? 'UnKnown error'),
        );
      },
      (success) async {
        emit(LogOutSuccess());
      },
    );
  }
}
