import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_assets.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/feature/onboarding/ui/widgets/page_view_item.dart';

class OnBoardingViews extends StatelessWidget {
  final PageController controller = PageController();
  OnBoardingViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [
          PageViewItem(
            controller: controller,
            image: AppAssets.onBoarding2,
            title: AppStrings.discoverMovies,
            description: AppStrings.exploreAvastDescription,
            index: 0,
          ),
          PageViewItem(
            controller: controller,
            image: AppAssets.onBoarding3,
            title: AppStrings.exploreAllGenres,
            description: AppStrings.discoverMoviesDescription,
            index: 1,
          ),
          PageViewItem(
            controller: controller,
            image: AppAssets.onBoarding1,
            title: AppStrings.createWatchlists,
            description: AppStrings.saveMoviesDescription,
            index: 2,
          ),
          PageViewItem(
            controller: controller,
            image: AppAssets.onBoardingLast,
            title: AppStrings.startWatchingNow,
            description: AppStrings.discoverMovies,
            index: 3,
          ),
        ],
      ),
    );
  }
}
