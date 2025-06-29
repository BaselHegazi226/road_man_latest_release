import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/show_snack_bar.dart';

import '../00_profile_common_widgets/custom_image_profile.dart';

class EditProfileImage extends StatefulWidget {
  const EditProfileImage({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.imagePath,
    required this.onImagePicked,
  });

  final double screenHeight;
  final double screenWidth;
  final String imagePath;

  /// ✅ عدلنا هنا: `File` بدل `String`
  final void Function(File imageFile) onImagePicked;

  @override
  State<EditProfileImage> createState() => _EditProfileImageState();
}

class _EditProfileImageState extends State<EditProfileImage> {
  String? _temporaryImagePath;

  Future<bool> _requestImagePermission() async {
    final status = await Permission.storage.request();

    return status.isGranted;
  }

  Future<void> _pickImage() async {
    final hasPermission = await _requestImagePermission();
    if (!hasPermission) {
      if (!mounted) return;
      showSafeSnackBar(
        context,
        '❌ Permission denied to access photos.',
        kAppPrimaryWrongColor,
      );
      return;
    }

    final picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (!mounted) return;

    if (pickedImage == null) {
      showSafeSnackBar(context, '⚠️ No image selected.', kAppPrimaryWrongColor);
      return;
    }

    final file = File(pickedImage.path);
    final fileLength = await file.length();

    if (fileLength == 0) {
      showSafeSnackBar(
        context,
        '❌ Selected image is empty or corrupt!',
        kAppPrimaryWrongColor,
      );
      return;
    }

    setState(() {
      _temporaryImagePath = pickedImage.path;
    });

    try {
      widget.onImagePicked(file); // ✅ نمرر ملف File هنا
      showSafeSnackBar(
        context,
        '✅ Image selected. Tap "Update Profile" to apply changes.',
        kAppPrimaryBlueColor,
      );
    } catch (e) {
      showSafeSnackBar(
        context,
        '❌ Error while processing image: ${e.toString()}',
        kAppPrimaryWrongColor,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final imagePath = _temporaryImagePath ?? widget.imagePath;

    return Stack(
      alignment: Alignment.center,
      children: [
        CustomImageProfile(imageSize: screenWidth * .42, imagePath: imagePath),
        Positioned(
          bottom: 0,
          right: widget.screenWidth * .01,
          child: Container(
            padding: EdgeInsets.all(widget.screenWidth * .01),
            decoration: const BoxDecoration(
              color: kFilledTextFormFieldColor,
              shape: BoxShape.circle,
            ),
            child: GestureDetector(
              onTap: _pickImage,
              child: Icon(
                Icons.camera_alt_outlined,
                size: widget.screenWidth * .05,
                color: kAppPrimaryBlackColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Future<File> base64ToTempFile(String base64String, String fileName) async {
  final directory = await getApplicationDocumentsDirectory();

  // ✅ إزالة prefix "data:image/png;base64,"
  final regex = RegExp(r'data:image/[^;]+;base64,');
  final cleanedBase64 = base64String.replaceFirst(regex, '');

  final bytes = base64Decode(cleanedBase64);
  final file = File('${directory.path}/$fileName');
  await file.writeAsBytes(bytes);
  return file;
}
