import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/refresh_token_cubit/refresh_token_state.dart';

import '../../../../../core/manager/tokens_manager.dart';
import '../../../data/repos/auth_repo.dart';

class RefreshTokenCubit extends Cubit<RefreshTokenStates> {
  // تعريف متغير للـ AuthRepo لتنفيذ طلب تحديث التوكن
  final AuthRepo authRepo;

  // الكونستركتور مع تمرير الـ AuthRepo عن طريق الحقن (DI)
  RefreshTokenCubit({required this.authRepo}) : super(RefreshTokenInitial());

  // دالة مسؤولة عن تحديث التوكن في حال انتهت صلاحيته
  Future<void> refreshTokenCubitFun() async {
    // إطلاق حالة تحميل أثناء عملية التحقق أو التحديث
    emit(RefreshTokenLoading());

    // الحصول على التوكنات من التخزين الآمن (حتى لو كانت منتهية)
    final userTokens = await SecureStorageHelper.getUserTokens();

    // إذا لم يتم العثور على توكنات، يتم إطلاق حالة فشل
    if (userTokens == null || userTokens.token.isEmpty) {
      emit(RefreshTokenFailure(errorMessage: 'No tokens found.'));
      return;
    }

    // الحصول على تاريخ انتهاء صلاحية التوكن من التخزين
    final expirationDate = await SecureStorageHelper.getUserTokenExpiration();

    // التحقق إذا كانت التوكن منتهية الصلاحية
    if (DateTime.now().isAfter(expirationDate)) {
      // إذا كانت منتهية، نقوم بمحاولة تحديثها عبر الريبو
      final result = await authRepo.refreshToken(
        accessToken: userTokens.token,
        refreshToken: userTokens.refreshToken,
      );

      // معالجة نتيجة التحديث: إما فشل أو نجاح
      await result.fold(
        // في حال الفشل: إطلاق حالة فشل مع الرسالة
        (failure) async {
          emit(
            RefreshTokenFailure(
              errorMessage: failure.errorMessage ?? 'Bloc Error',
            ),
          );
        },
        // في حال النجاح: إطلاق حالة نجاح مع التوكن الجديد
        (successUserToken) async {
          emit(RefreshTokenSuccess(userTokensModel: successUserToken));
        },
      );
    } else {
      emit(RefreshTokenSuccess(userTokensModel: userTokens));
    }
  }
}
