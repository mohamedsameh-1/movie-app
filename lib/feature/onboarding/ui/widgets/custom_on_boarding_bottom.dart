import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/core/utils/shared_prefrence.dart';

class CustomOnboardingBottom extends StatelessWidget {
  final int index;
  final PageController controller;
  final String title;
  final String descreption;
  final Function()? nextOnTap;
  final Function()? backOnTap;
  const CustomOnboardingBottom({
    super.key,
    required this.title,
    required this.descreption,
    this.nextOnTap,
    this.backOnTap,
    required this.controller,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      bottom: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.all(16.r),
        // width: 398.w,
        // height: index == 0
        //     ? 260.h
        //     : index == 3
        //     ? 230.h
        //     : 321.h,
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.r),
            topRight: Radius.circular(40.r),
          ),
        ),
        child: Column(
          spacing: 16.h,
          children: [
            Text(title, style: AppStyles.w700S24White),
            index == 3
                ? SizedBox()
                : Text(descreption, style: AppStyles.w400S20White),
            //next or finish
            GestureDetector(
              onTap: () {
                if (index == 3) {
                  SharedPreference.saveData(
                    key: AppStrings.isFirstOpen,
                    value: true,
                  );
                  Navigator.pushReplacementNamed(context, AppRoutes.logIn);
                } else {
                  controller.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                }
                // index == 3
                //     ? Navigator.pushNamed(context, AppRoutes.logIn)
                //     : controller.nextPage(
                //         duration: Duration(milliseconds: 300),
                //         curve: Curves.easeIn,
                //       );
              },
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Center(
                  child: Text(
                    index == 3 ? AppStrings.finish : AppStrings.next,
                    style: AppStyles.w600S20Black,
                  ),
                ),
              ),
            ),
            //back
            index == 0
                ? SizedBox()
                : GestureDetector(
                    onTap: () {
                      controller.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(color: AppColors.yellow),
                      ),
                      child: Center(
                        child: Text(
                          AppStrings.back,
                          style: AppStyles.w600S20Yellow,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
