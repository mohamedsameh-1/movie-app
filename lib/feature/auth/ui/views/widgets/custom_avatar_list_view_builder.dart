import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/feature/auth/ui/viewmodel/register/register_cubit.dart';
import 'package:movie_app/feature/auth/ui/viewmodel/register/register_state.dart';

class CustomAvatarListViewBuilder extends StatelessWidget {
  const CustomAvatarListViewBuilder({super.key});

  // int selectedIndex = 0;

  // final List<String> avatars = [
  //   AppAssets.avatar1Image,
  //   AppAssets.avatar2Image,
  //   AppAssets.avatar3Image,
  //   // AppAssets.avatar4Image,
  //   AppAssets.avatar5Image,
  //   AppAssets.avatar6Image,
  //   // AppAssets.avatar7Image,
  //   AppAssets.avatar8Image,
  //   AppAssets.avatar9Image,
  // ];

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.read<RegisterCubit>();
    return SizedBox(
      height: 160.h,
      child: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(width: 24.w),
            scrollDirection: Axis.horizontal,
            itemCount: registerCubit.avatars.length,
            itemBuilder: (context, index) {
              final bool isSelectedAvatar =
                  registerCubit.selectedAvatarIndex == index;
              return GestureDetector(
                onTap: () {
                  // registerCubit.selectedAvatarIndex = index;
                  registerCubit.changeAvatar(index);
                  // print(selectedIndex);
                  // setState(() {});
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: isSelectedAvatar
                        ? Border.all(color: AppColors.yellow, width: 10.r)
                        : null,
                  ),
                  child: Image.asset(registerCubit.avatars[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
