import 'package:flutter/material.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_up_widgets/two_check_password_item.dart';

import '../../../../../../core/helper/class_const_functions.dart';
import 'check_password_item.dart';

class CheckPasswordSection extends StatelessWidget {
  const CheckPasswordSection({
    super.key,
    required this.containsPassLength,
    required this.containsSpecialChar,
    required this.containsNumber,
    required this.containsUpperCase,
    required this.containsLowerCase,
  });
  final bool containsUpperCase;
  final bool containsLowerCase;
  final bool containsSpecialChar;
  final bool containsNumber;
  final bool containsPassLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TwoCheckPasswordItem(
          iconData1:
              ConstFunctions.iconDataAndColorFun(
                condition: containsUpperCase,
              ).value1,
          iconData2:
              ConstFunctions.iconDataAndColorFun(
                condition: containsLowerCase,
              ).value1,
          color1:
              ConstFunctions.iconDataAndColorFun(
                condition: containsUpperCase,
              ).value2,
          color2:
              ConstFunctions.iconDataAndColorFun(
                condition: containsLowerCase,
              ).value2,
          text1: 'Upper case',
          text2: 'Lower case',
        ),
        TwoCheckPasswordItem(
          iconData1:
              ConstFunctions.iconDataAndColorFun(
                condition: containsNumber,
              ).value1,
          iconData2:
              ConstFunctions.iconDataAndColorFun(
                condition: containsSpecialChar,
              ).value1,
          color1:
              ConstFunctions.iconDataAndColorFun(
                condition: containsNumber,
              ).value2,
          color2:
              ConstFunctions.iconDataAndColorFun(
                condition: containsSpecialChar,
              ).value2,
          text1: 'At least number',
          text2: 'Special character',
        ),
        CheckPasswordItem(
          iconData:
              ConstFunctions.iconDataAndColorFun(
                condition: containsPassLength,
              ).value1,
          color:
              ConstFunctions.iconDataAndColorFun(
                condition: containsPassLength,
              ).value2,
          text: 'At least 8 characters',
        ),
      ],
    );
  }
}
