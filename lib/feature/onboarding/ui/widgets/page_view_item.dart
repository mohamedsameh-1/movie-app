import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/feature/onboarding/ui/widgets/custom_on_boarding_bottom.dart';

class PageViewItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final int index;

  const PageViewItem({
    super.key,
    required this.controller,
    required this.image,
    required this.title,
    required this.description,
    required this.index,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Image.asset(image, fit: BoxFit.fill)),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.darkBlueWithZeroOpacity,
                  AppColors.darkBlueWith100pacity,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        CustomOnboardingBottom(
          title: title,
          descreption: description,
          controller: controller,
          index: index,
        ),
      ],
    );
  }
}
