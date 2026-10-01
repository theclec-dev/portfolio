import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_color_tokens.dart';
import 'package:portfolio/core/theme/app_colors.dart';

class AppThemes {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ? darkTheme : lightTheme;
  }

  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    dividerColor: AppColorTokens.light.divider,
    scaffoldBackgroundColor: AppColorTokens.light.background,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
      surface: AppColorTokens.light.surface,
    ),
    extensions: const [AppColorTokens.light],
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    dividerColor: AppColorTokens.dark.divider,
    scaffoldBackgroundColor: AppColorTokens.dark.background,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
      surface: AppColorTokens.dark.surface,
    ),
    extensions: const [AppColorTokens.dark],
  );

  // static final defaultPinTheme = PinTheme(
  //   width: 48.w,
  //   height: 49.h,
  //   textStyle: AppTextStyles.title.copyWith(
  //     fontWeight: FontWeight.w400,
  //     fontSize: 32.sp,
  //     height: (48 / 32).sp,
  //   ),
  //   decoration: BoxDecoration(
  //     color: AppColors.white,
  //     borderRadius: BorderRadius.circular(8.r),
  //     border: Border.all(color: AppColors.textFieldBorder),
  //   ),
  // );
}
