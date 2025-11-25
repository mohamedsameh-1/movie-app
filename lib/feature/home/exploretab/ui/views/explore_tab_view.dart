import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/di/di.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/feature/home/exploretab/ui/views/widgets/custom_grid_view_of_movie.dart';
import 'package:movie_app/feature/home/exploretab/view_model/browse_cubit.dart';
import 'package:movie_app/feature/home/exploretab/view_model/browse_state.dart';

class ExploreTabView extends StatelessWidget {
  const ExploreTabView({super.key});

  @override
  Widget build(BuildContext context) {
    BrowseCubit browseCubit = getIt<BrowseCubit>();
    return BlocBuilder<BrowseCubit, BrowseState>(
      bloc: browseCubit..browseState(),
      builder: (context, state) {
        if (state is BrowseLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is BrowseFailureState) {
          return Center(
            child: Text(
              state.failure.failureMessage,
              style: AppStyles.w400S20White,
            ),
          );
        } else if (state is BrowseSuccessState) {
          return DefaultTabController(
            length: browseCubit.gener.length,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Builder(
                  builder: (context) {
                    final controller = DefaultTabController.of(context);
                    controller.addListener(() {
                      if (!controller.indexIsChanging) {
                        browseCubit.changeIndeTab(controller.index);
                      }
                    });
                    return Column(
                      children: [
                        TabBar(
                          controller: controller,
                          onTap: (value) {
                            // selectedIndex = value;
                            // setState(() {});
                            browseCubit.changeIndeTab(value);
                          },
                          isScrollable: true,
                          dividerColor: AppColors.transparent,
                          indicatorColor: AppColors.transparent,
                          labelPadding: EdgeInsets.symmetric(horizontal: 8.w),
                          tabAlignment: TabAlignment.start,
                          tabs: List.generate(browseCubit.gener.length, (i) {
                            final isSelected = i == browseCubit.selectedIndex;
                            return Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 12.h,
                              ),
                              margin: EdgeInsets.only(bottom: 15.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(color: AppColors.yellow),
                                color: isSelected
                                    ? AppColors.yellow
                                    : AppColors.black,
                              ),
                              child: Text(
                                browseCubit.gener[i],
                                style: isSelected
                                    ? AppStyles.w700S20Black
                                    : AppStyles.w700S20Wite,
                              ),
                            );
                          }),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: controller,

                            children: List.generate(browseCubit.gener.length, (
                              index,
                            ) {
                              final gener = browseCubit.gener[index];
                              final movies = browseCubit.getMovieByGener(gener);
                              return CustomGridViewOfMovie(movies: movies);
                            }),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        }
        return Center(child: Text('oops', style: AppStyles.w700S20Wite));
      },
    );
  }
}
