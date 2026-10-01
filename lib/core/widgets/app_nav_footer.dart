import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/router/app_router.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';

enum AppNavItem { projects, about, contact }

/// Shared Projects/About/Contact link row reused by every page except
/// Landing. Hides [current]'s own link and always navigates (fixes the
/// pre-existing bug where the Contact link had no tap handler anywhere but
/// the About page).
class AppNavFooter extends StatelessWidget {
  const AppNavFooter({
    super.key,
    this.current,
    this.mainAxisAlignment = MainAxisAlignment.end,
    this.gap,
    this.colorOverride,
  });

  final AppNavItem? current;
  final MainAxisAlignment mainAxisAlignment;
  final double? gap;
  final Color? colorOverride;

  @override
  Widget build(BuildContext context) {
    final items = [
      if (current != AppNavItem.projects) AppNavItem.projects,
      if (current != AppNavItem.about) AppNavItem.about,
      if (current != AppNavItem.contact) AppNavItem.contact,
    ];

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        for (var i = 0; i < items.length; i++) ...[
          if (i != 0) Gap(gap ?? 50.w),
          _NavLink(item: items[i], colorOverride: colorOverride),
        ],
      ],
    );
  }
}

class _NavLink extends StatelessWidget {
  const _NavLink({required this.item, this.colorOverride});

  final AppNavItem item;
  final Color? colorOverride;

  @override
  Widget build(BuildContext context) {
    final String tag;
    final String label;
    final PageRouteInfo route;
    switch (item) {
      case AppNavItem.projects:
        tag = 'projects';
        label = 'Projects';
        route = ProjectsRoute();
        break;
      case AppNavItem.about:
        tag = 'about';
        label = 'About';
        route = AboutRoute();
        break;
      case AppNavItem.contact:
        tag = 'contact';
        label = 'Contact';
        route = ContactRoute();
        break;
    }

    var style = AppTextStyles.section(context);
    if (colorOverride != null) style = style.copyWith(color: colorOverride);

    return GestureDetector(
      onTap: () => context.replaceRoute(route),
      child: Hero(tag: tag, child: Text(label, style: style)),
    );
  }
}
