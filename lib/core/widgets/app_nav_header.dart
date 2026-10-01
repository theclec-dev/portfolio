import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/core/router/app_router.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';
import 'package:portfolio/core/theme/theme_controller.dart';

/// Shared avatar+brand header reused by every page except Landing (which has
/// its own centerpiece treatment). Taps the avatar/brand to go home, and
/// carries the light/dark theme toggle.
class AppNavHeader extends ConsumerWidget {
  const AppNavHeader({
    super.key,
    this.avatarRadius,
    this.gap,
    this.trailing,
  });

  final double? avatarRadius;
  final double? gap;

  /// Extra content shown next to the theme toggle (e.g. the Project Details
  /// page's "Projects" back-link).
  final Widget? trailing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => context.replaceRoute(LandingRoute()),
          child: Container(
            color: Colors.transparent,
            child: Row(
              children: [
                Hero(
                  tag: 'avatar',
                  child: CircleAvatar(
                    radius: avatarRadius ?? 20.r,
                    backgroundImage: AssetImage(AppAssets.avatarVector),
                  ),
                ),
                Gap(gap ?? 20.w),
                Hero(
                  tag: 'brand_name',
                  child: Text(
                    'CLEC.Dev',
                    style: AppTextStyles.brandName(context),
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          children: [
            if (trailing != null) trailing!,
            Gap(16.w),
            IconButton(
              tooltip: isDark ? 'Switch to light mode' : 'Switch to dark mode',
              onPressed: () {
                ref.read(ThemeController().themeModeProvider.notifier).state =
                    isDark ? ThemeMode.light : ThemeMode.dark;
              },
              icon: Icon(isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
            ),
          ],
        ),
      ],
    );
  }
}
