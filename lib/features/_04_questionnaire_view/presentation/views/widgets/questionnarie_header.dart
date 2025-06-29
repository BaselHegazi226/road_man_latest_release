import 'package:flutter/material.dart';

// الكلاسات المنفصلة
class QuestionnaireHeader extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const QuestionnaireHeader({
    super.key,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: MediaQuery.sizeOf(context).height * .02,
      children: [],
    );
  }
}
