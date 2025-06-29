import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/features/_06_home_view/data/model/progress_model.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view/widgets/progress_section_widgets/left_section.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view/widgets/progress_section_widgets/progress_circle.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view_model/progress_cubit/progress_cubit.dart';

class ProgressSection extends StatelessWidget {
  const ProgressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return BlocBuilder<ProgressCubit, ProgressState>(
      builder: (context, state) {
        if (state is ProgressInitial || state is ProgressLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        // 2. في حالة النجاح
        else if (state is ProgressSuccess) {
          final ProgressModel progress = state.progress;
          return IntrinsicHeight(
            child: Container(
              width: double.infinity,
              //height: screenSize.height * .165,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: kSecondlyLightWhiteColor,
                borderRadius: BorderRadius.circular(screenSize.width * .04),
                border: Border.all(width: 1, color: kAppPrimaryBlueColor),
              ),
              child: Padding(
                padding: EdgeInsets.all(screenSize.width * .04),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left section with progress stats and button
                    LeftSection(progress: progress),
                    // Right section with progress circle
                    ProgressCircle(totalProgress: progress.totalProgress),
                  ],
                ),
              ),
            ),
          );
        }
        // 3. في حالة الفشل
        else if (state is ProgressFailure) {
          return Center(child: Text('Error: ${state.errorMessage}'));
        }
        // لأي حالة أخرى (غير متوقع)
        else {
          return const Center(child: Text('Something went wrong!'));
        }
      },
    );
  }
}
