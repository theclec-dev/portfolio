import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';

class AppColorTokens extends ThemeExtension<AppColorTokens> {
  final Color background;
  final Color surface;
  final Color textPrimary;
  final Color textSecondary;
  final Color divider;
  final Color heroBackground;
  final Color heroForeground;

  const AppColorTokens({
    required this.background,
    required this.surface,
    required this.textPrimary,
    required this.textSecondary,
    required this.divider,
    required this.heroBackground,
    required this.heroForeground,
  });

  static const light = AppColorTokens(
    background: AppColors.white,
    surface: AppColors.white,
    textPrimary: AppColors.black,
    textSecondary: AppColors.divider,
    divider: AppColors.divider,
    heroBackground: AppColors.white,
    heroForeground: AppColors.black,
  );

  static const dark = AppColorTokens(
    background: AppColors.darkGrey,
    surface: AppColors.black,
    textPrimary: AppColors.white,
    textSecondary: AppColors.primaryGrey,
    divider: AppColors.divider,
    heroBackground: AppColors.darkGrey,
    heroForeground: AppColors.white,
  );

  @override
  AppColorTokens copyWith({
    Color? background,
    Color? surface,
    Color? textPrimary,
    Color? textSecondary,
    Color? divider,
    Color? heroBackground,
    Color? heroForeground,
  }) {
    return AppColorTokens(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      divider: divider ?? this.divider,
      heroBackground: heroBackground ?? this.heroBackground,
      heroForeground: heroForeground ?? this.heroForeground,
    );
  }

  @override
  AppColorTokens lerp(ThemeExtension<AppColorTokens>? other, double t) {
    if (other is! AppColorTokens) return this;
    return AppColorTokens(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      heroBackground: Color.lerp(heroBackground, other.heroBackground, t)!,
      heroForeground: Color.lerp(heroForeground, other.heroForeground, t)!,
    );
  }
}
