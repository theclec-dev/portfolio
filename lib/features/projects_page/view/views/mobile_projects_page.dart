import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:portfolio/core/router/app_router.dart';
import 'package:portfolio/core/theme/app_color_tokens.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';
import 'package:portfolio/core/widgets/app_nav_footer.dart';
import 'package:portfolio/core/widgets/app_nav_header.dart';
import 'package:portfolio/core/widgets/store_badge_column.dart';
import 'package:portfolio/features/projects_page/controller/projects_controller.dart';

class MobileProjectsPage extends ConsumerStatefulWidget {
  const MobileProjectsPage({super.key});

  @override
  ConsumerState<MobileProjectsPage> createState() => _MobileProjectsPageState();
}

class _MobileProjectsPageState extends ConsumerState<MobileProjectsPage> {
  final con = ProjectsController();
  int? _hoveredIndex;

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppColorTokens>()!;
    final inverted = ref.watch(con.invertedProvider);
    final bg = inverted ? tokens.heroForeground : tokens.heroBackground;
    final fg = inverted ? tokens.heroBackground : tokens.heroForeground;
    final hoveredProject = ref.watch(con.hoveredProjectProvider);

    return Scaffold(
      backgroundColor: tokens.background,
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        color: bg,
        padding: EdgeInsets.all(12.w),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 87.h),
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StoreBadgeColumn(
                    project: hoveredProject,
                    side: StoreSide.playStore,
                    color: fg,
                    badgeHeight: 24.h,
                    itemGap: 51.h,
                  ),
                  Gap(20.w),
                  StoreBadgeColumn(
                    project: hoveredProject,
                    side: StoreSide.playStore,
                    color: fg,
                    badgeHeight: 24.h,
                    itemGap: 51.h,
                  ),
                  const Spacer(),
                  StoreBadgeColumn(
                    project: hoveredProject,
                    side: StoreSide.appStore,
                    color: fg,
                    badgeHeight: 24.h,
                    itemGap: 51.h,
                  ),
                  Gap(20.w),
                  StoreBadgeColumn(
                    project: hoveredProject,
                    side: StoreSide.appStore,
                    color: fg,
                    badgeHeight: 24.h,
                    itemGap: 51.h,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                AppNavHeader(avatarRadius: 20.r, gap: 8.w),
                Gap(32.h),
                Hero(
                  tag: 'projects',
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 250),
                    style: AppTextStyles.pageTitle(context).copyWith(color: fg),
                    child: const Text('Projects'),
                  ),
                ),
                Gap(32.h),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 10.h),
                    itemBuilder: (context, index) {
                      final project = con.projects[index];
                      return Container(
                        padding: EdgeInsets.only(bottom: 24.h),
                        child: Center(
                          child: MouseRegion(
                            onEnter: (_) {
                              setState(() => _hoveredIndex = index);
                              ref.read(con.hoveredProjectProvider.notifier).state = project;
                              ref.read(con.invertedProvider.notifier).state = true;
                            },
                            onExit: (_) {
                              setState(() => _hoveredIndex = null);
                              ref.read(con.hoveredProjectProvider.notifier).state = null;
                              ref.read(con.invertedProvider.notifier).state = false;
                            },
                            child: GestureDetector(
                              onTap: () {
                                ref.read(projectProvider.notifier).state = project;
                                context.pushRoute(ProjectDetailsRoute(project: project));
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.r),
                                    child: Image.asset(
                                      project.iconAsset,
                                      width: 36.w,
                                      height: 36.w,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Gap(12.w),
                                  AnimatedDefaultTextStyle(
                                    duration: const Duration(milliseconds: 250),
                                    style: AppTextStyles.projectName(context).copyWith(color: fg),
                                    child: Text(project.name),
                                  ),
                                ],
                              )
                                  .animate(target: _hoveredIndex == index ? 1 : 0)
                                  .scaleXY(begin: 1, end: 1.03, duration: 180.ms),
                            ),
                          ),
                        ),
                      )
                          .animate(delay: (index * 60).clamp(0, 480).ms)
                          .fadeIn(duration: 400.ms)
                          .slideX(begin: 0.08, end: 0);
                    },
                    itemCount: con.projects.length,
                  ),
                ),
                AppNavFooter(current: AppNavItem.projects, colorOverride: fg, gap: 12.w),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
