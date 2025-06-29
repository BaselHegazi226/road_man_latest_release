import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/common_widgets/job_view_const_list.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/favourite_view_widgets/favourite_card.dart';

class FavouriteCardListView extends StatelessWidget {
  const FavouriteCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Expanded(
      child:
          JobViewConstList.favouriteCardList.isEmpty
              ? Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No Favourite',
                      style: AfacadTextStyles.textStyle24W700Black(
                        context,
                      ).copyWith(
                        fontSize: screenWidth * 0.06, // 6% من عرض الشاشة
                      ),
                    ),
                    Icon(
                      CupertinoIcons.heart_fill,
                      size: screenWidth * 0.08, // 8% من عرض الشاشة
                      color: Colors.red,
                    ),
                    Text(
                      'Items Yet!',
                      style: AfacadTextStyles.textStyle24W700Black(
                        context,
                      ).copyWith(
                        fontSize: screenWidth * 0.06, // 6% من عرض الشاشة
                      ),
                    ),
                  ],
                ),
              )
              : ListView.builder(
                itemCount: JobViewConstList.favouriteCardList.length,
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.012),
                    child: FavouriteCard(
                      recentJobsCardItemModel:
                          JobViewConstList.favouriteCardList.isEmpty
                              ? null
                              : JobViewConstList.favouriteCardList[index],
                    ),
                  );
                },
              ),
    );
  }
}
