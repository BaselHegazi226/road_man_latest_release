import 'dart:convert'; // ضروري عشان base64Decode
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:road_man_project/generated/assets.dart';

class CustomImageProfile extends StatelessWidget {
  const CustomImageProfile({
    super.key,
    required this.imagePath,
    required this.imageSize,
  });

  final String imagePath;
  final double imageSize;

  ImageProvider getImageProvider(String path) {
    if (path.startsWith('http')) {
      return NetworkImage(path);
    } else if (path.startsWith('data:image') || _isBase64(path)) {
      final cleanedBase64 = _cleanBase64(path);
      final decodedBytes = base64Decode(cleanedBase64);
      return MemoryImage(decodedBytes);
    } else if (File(path).existsSync()) {
      return FileImage(File(path));
    } else {
      return const AssetImage(Assets.profileDefaultImage);
    }
  }

  // تحذف prefix زي: data:image/png;base64,
  String _cleanBase64(String base64String) {
    final regex = RegExp(r'data:image/[^;]+;base64,');
    return base64String.replaceFirst(regex, '');
  }

  // يتأكد لو string غالبًا base64
  bool _isBase64(String str) {
    return str.length > 100 &&
        !str.contains('http') &&
        !str.contains('/') &&
        !str.contains('\\');
  }

  @override
  Widget build(BuildContext context) {
    final imageProvider = getImageProvider(imagePath);

    return Container(
      width: imageSize,
      height: imageSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
      ),
    );
  }
}
