import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';
import 'custom_dashboard.dart';

void openDashboard(BuildContext context, Widget body) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    transitionDuration: const Duration(milliseconds: 600),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Material(
        color: Colors.transparent,
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                color: kAppPrimaryWhiteColor.withAlpha(50),
              ),
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-1, 0),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(parent: animation, curve: Curves.decelerate),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: double.infinity,
                    color: kAppPrimaryWhiteColor,
                    child: CustomDrawer(body: body),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}
