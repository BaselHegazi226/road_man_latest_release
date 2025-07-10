import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProfileUserInfoShimmer extends StatelessWidget {
  const ProfileUserInfoShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade500,
      highlightColor: Colors.grey.shade300,
      child: Row(
        spacing: 16,
        children: [
          // ✅ صورة بروفايل وهمية باستخدام CircleAvatar
          const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white, // لازم تكون نفس لون الـ base
          ),
          // ✅ النصين الرأسين
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Container(width: 120, height: 16, color: Colors.white),

              Container(width: 80, height: 14, color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }
}
