import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/features/_09_profile_view/data/models/update_profile_model/user_info_model.dart';
import 'package:road_man_project/features/_09_profile_view/data/repos/profile_repos/profile_repos.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/profile_blocs/profile_state.dart';

import '../../../../../core/manager/user_info_manager.dart';
import 'get_user_info_state.dart';

class GetUserInfoCubit extends Cubit<ProfileStates> {
  final ProfileRepos profileRepos;

  GetUserInfoCubit({required this.profileRepos}) : super(ProfileInitial());

  Future<void> getUserInfo({required String userToken}) async {
    emit(GetUserInfoLoadingState());

    final result = await profileRepos.getUserInfo(userToken: userToken);

    await result.fold(
      (error) async {
        emit(
          GetUserInfoFailureState(
            errorMessage: error.errorMessage ?? 'Unknown error',
          ),
        );
      },
      (success) async {
        final userInfoModel = UserInfoModel.fromJson(success);
        await UserInfoStorageHelper.saveUserInfo(userInfoModel);
        emit(GetUserInfoSuccessState(userInfoModel: userInfoModel));
      },
    );
  }

  /// ✅ الدالة الجديدة لاسترجاع بيانات المستخدم من التخزين المحلي
  Future<void> localGetUserInfo() async {
    final userInfoModel = await UserInfoStorageHelper.getUserInfo();

    if (userInfoModel != null) {
      emit(GetUserInfoLocalSuccessState(userInfoModel: userInfoModel));
    } else {
      emit(GetUserInfoFailureState(errorMessage: 'No local user info found.'));
    }
  }
}
