import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:portfolio/core/router/app_router.dart';
import 'package:portfolio/core/theme/app_color_tokens.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';
import 'package:portfolio/core/widgets/app_nav_footer.dart';
import 'package:portfolio/core/widgets/app_nav_header.dart';
import 'package:portfolio/features/projects_page/models/project_model.dart';

class DesktopProjectDetailsView extends StatelessWidget {
  const DesktopProjectDetailsView({super.key, required this.project});
  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppColorTokens>()!;
    return Scaffold(
      backgroundColor: tokens.surface,
      body: Padding(
        padding: EdgeInsets.fromLTRB(95.w, 54.h, 40.w, 23.h),
        child: Column(
          children: [
            AppNavHeader(
              trailing: GestureDetector(
                onTap: () => context.replaceRoute(ProjectsRoute()),
                child: Hero(
                  tag: 'projects',
                  child: Text('Projects', style: AppTextStyles.section(context)),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Gap(80.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(32.r),
                      child: Image.asset(
                        project.iconAsset,
                        width: 160.w,
                        height: 160.w,
                        fit: BoxFit.cover,
                      ),
                    ).animate().fadeIn(duration: 500.ms).scale(begin: const Offset(0.9, 0.9)),
                    Gap(40.h),
                    Text(
                      project.name,
                      style: AppTextStyles.pageTitle(context).copyWith(
                        fontSize: 64.spMin,
                        fontWeight: FontWeight.w800,
                      ),
                    ).animate(delay: 100.ms).fadeIn(duration: 500.ms).slideY(begin: 0.1, end: 0),
                    Gap(32.h),
                    Text(
                      project.description,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.projectName(context).copyWith(
                        height: (54 / 48).spMin,
                      ),
                    ).animate(delay: 150.ms).fadeIn(duration: 500.ms).slideY(begin: 0.1, end: 0),
                    Gap(48.h),
                    Wrap(
                      spacing: 24.w,
                      runSpacing: 16.h,
                      alignment: WrapAlignment.center,
                      children: [
                        if (project.playStoreUrl != null)
                          _StoreLinkButton(label: 'Google Play', url: project.playStoreUrl!),
                        if (project.appStoreUrl != null)
                          _StoreLinkButton(label: 'App Store', url: project.appStoreUrl!),
                      ],
                    ).animate(delay: 200.ms).fadeIn(duration: 500.ms).slideY(begin: 0.1, end: 0),
                    Gap(39.h),
                  ],
                ),
              ),
            ),
            AppNavFooter(current: AppNavItem.projects),
          ],
        ),
      ),
    );
  }
}

class _StoreLinkButton extends StatelessWidget {
  const _StoreLinkButton({required this.label, required this.url});
  final String label;
  final String url;

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppColorTokens>()!;
    return OutlinedButton.icon(
      onPressed: () => launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
      icon: Icon(Icons.open_in_new, size: 18.sp, color: tokens.textPrimary),
      label: Text(label, style: AppTextStyles.section(context)),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: tokens.divider),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      ),
    );
  }
}
