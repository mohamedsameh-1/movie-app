import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_styles.dart';

enum MessageType { loading, success, error }

class CustomMessageDialog extends StatelessWidget {
  final String message;
  final MessageType type;

  const CustomMessageDialog({
    super.key,
    required this.message,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color iconColor;

    // تحديد الأيقونة واللون حسب الحالة
    switch (type) {
      case MessageType.loading:
        icon = Icons.hourglass_empty_rounded;
        iconColor = AppColors.yellow;
        break;
      case MessageType.success:
        icon = Icons.check_circle_outline;
        iconColor = Colors.green;
        break;
      case MessageType.error:
        icon = Icons.error_outline;
        iconColor = Colors.red;
        break;
    }

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (type == MessageType.loading)
              const CircularProgressIndicator()
            else
              Icon(icon, color: iconColor, size: 50),
            SizedBox(height: 20.h),
            Text(
              message,
              style: AppStyles.w600S20Yellow,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
