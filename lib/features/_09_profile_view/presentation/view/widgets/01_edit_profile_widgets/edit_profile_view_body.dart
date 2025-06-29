import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/manager/user_info_manager.dart';
import 'package:road_man_project/core/utilities/custom_text_button.dart';
import 'package:road_man_project/core/utilities/custom_title.dart';
import 'package:road_man_project/core/utilities/routes.dart';
import 'package:road_man_project/core/utilities/show_snack_bar.dart';
import 'package:road_man_project/features/_09_profile_view/data/models/update_profile_model/user_info_model.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/profile_blocs/profile_bloc.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/profile_blocs/profile_event.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/profile_blocs/profile_state.dart';

import 'change_password_button.dart';
import 'edit_profile_image.dart';
import 'edit_profile_names_fields_section.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  final TextEditingController nameEditingController = TextEditingController();
  bool buttonIsLoading = false;
  UserInfoModel? userInfoModel;
  File? newPickedImageFile;

  @override
  void initState() {
    super.initState();
    _deleteOldTempImages();
    _loadUserData();
  }

  Future<void> _deleteOldTempImages() async {
    final dir = await getTemporaryDirectory();
    final files = dir.listSync();

    for (var file in files) {
      if (file is File && file.path.contains('user_profile_')) {
        await file.delete();
      }
    }
  }

  Future<void> _loadUserData() async {
    final userInfo = await UserInfoStorageHelper.getUserInfo();

    File? base64File;
    if (userInfo?.photoBase64 != null &&
        userInfo!.photoBase64!.trim().isNotEmpty) {
      base64File = await base64ToTempFile(
        userInfo.photoBase64!,
        'user_profile_${DateTime.now().millisecondsSinceEpoch}.jpg',
      );
    }

    if (!mounted) return;
    setState(() {
      userInfoModel = userInfo;
      nameEditingController.text = userInfo?.name ?? '';
      newPickedImageFile = base64File;
    });
  }

  String getCurrentImagePath() {
    return newPickedImageFile?.path ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * .04,
        vertical: screenHeight * .04,
      ),
      child: Column(
        children: [
          EditProfileImage(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            imagePath: getCurrentImagePath(),
            onImagePicked: (imageFile) {
              setState(() {
                newPickedImageFile = imageFile;
              });
            },
          ),
          SizedBox(height: screenHeight * .03),
          if (userInfoModel != null)
            EditProfileNamesFieldsSection(
              nameEditingController: nameEditingController,
              email: userInfoModel!.email ?? '',
            ),
          SizedBox(height: screenHeight * .03),
          ChangePasswordButton(
            onPressed: () {
              GoRouter.of(context).push(Routes.changePasswordViewId);
            },
          ),
          SizedBox(height: screenHeight * .03),
          BlocConsumer<ProfileBloc, ProfileStates>(
            listener: (context, state) async {
              if (state is UpdateProfileFailureState) {
                showSafeSnackBar(
                  context,
                  state.errorMessage,
                  kAppPrimaryWrongColor,
                );
              } else if (state is UpdateProfileSuccessState) {
                final updatedModel = state.updateProfileGetModel;

                File? base64File;
                if (updatedModel.base64.trim().isNotEmpty) {
                  base64File = await base64ToTempFile(
                    updatedModel.base64,
                    'user_profile_${DateTime.now().millisecondsSinceEpoch}.jpg',
                  );
                }

                final newUser = UserInfoModel(
                  name: updatedModel.name,
                  photo: updatedModel.photUrl,
                  photoBase64: updatedModel.base64,
                  dateOfBirth: updatedModel.dateOfBirth,
                  email: userInfoModel?.email,
                  userID: userInfoModel?.userID,
                );

                await UserInfoStorageHelper.saveUserInfo(newUser);

                if (!mounted) return;
                setState(() {
                  userInfoModel = newUser;
                  nameEditingController.text = newUser.name ?? '';
                  newPickedImageFile = base64File;
                });

                showSafeSnackBar(
                  context,
                  'Update Profile Success',
                  kAppPrimaryBlueColor,
                );
              }
              setState(() {
                buttonIsLoading = state is UpdateProfileLoadingState;
              });
            },
            builder: (context, state) {
              return CustomTextButton(
                onPressed: () {
                  if (userInfoModel == null) return;

                  context.read<ProfileBloc>().add(
                    UpdateProfileEvent(
                      name: nameEditingController.text.trim(),
                      photoFile: newPickedImageFile,
                      dateOfBirth: userInfoModel!.dateOfBirth ?? DateTime.now(),
                    ),
                  );
                },
                backgroundColor: kAppPrimaryBlueColor,
                child:
                    buttonIsLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const CustomTitle(title: 'Update Profile'),
              );
            },
          ),
        ],
      ),
    );
  }
}
