import 'package:flutter/material.dart';

class QuizViewCardRadioButtonCircle extends StatelessWidget {
  final bool isSelected;
  final double size;
  final Color selectedColor;
  final Color unselectedColor;

  const QuizViewCardRadioButtonCircle({
    super.key,
    required this.isSelected,
    required this.size,
    required this.selectedColor,
    required this.unselectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? selectedColor : unselectedColor,
          width: size * 0.1,
        ),
      ),
      child:
          isSelected
              ? Center(
                child: ClipOval(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: size * 0.5,
                    height: size * 0.5,
                    decoration: BoxDecoration(color: selectedColor),
                  ),
                ),
              )
              : null,
    );
  }
}
