import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/app_styles.dart';

class AnimatedToogleSwitchWidget extends StatefulWidget {
  const AnimatedToogleSwitchWidget({super.key});

  @override
  State<AnimatedToogleSwitchWidget> createState() =>
      _AnimatedToogleSwitchWidgetState();
}

class _AnimatedToogleSwitchWidgetState
    extends State<AnimatedToogleSwitchWidget> {
  bool isEnglish = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<bool>.dual(
      current: isEnglish,
      first: true,
      second: false,
      style: ToggleStyle(
        borderColor: AppColors.yellow,
        indicatorColor: AppColors.yellow,
        backgroundColor: AppColors.black,
      ),
      iconBuilder: (value) {
        return value ? Flag(Flags.united_states_of_america) : Flag(Flags.egypt);
      },
      textBuilder: (value) {
        return Text(
          value ? AppStrings.en : AppStrings.ar,
          style: AppStyles.w400S14White,
        );
      },
      onChanged: (value) {
        setState(() {
          isEnglish = value;
        });
      },
    );
  }
}
