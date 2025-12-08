import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:movie_app/core/provider/language_provider.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:provider/provider.dart';

class AnimatedToogleSwitchWidget extends StatelessWidget {
  const AnimatedToogleSwitchWidget({super.key});

  // bool isEnglish = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<bool>.dual(
      // current: isEnglish,
      current: Provider.of<LanguageProvider>(context).isEnglish,
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
          value ? AppStrings.en.tr() : AppStrings.ar.tr(),
          style: AppStyles.w400S14White,
        );
      },
      onChanged: (value) async {
        // setState(() {
        //   isEnglish = value;
        // });

        Provider.of<LanguageProvider>(
          context,
          listen: false,
        ).changeLanguage(value);
        if (value) {
          await context.setLocale(const Locale(AppStrings.en));
        } else {
          await context.setLocale(const Locale(AppStrings.ar));
        }
      },
    );
  }
}
