import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/core/router/app_router.dart';
import 'package:portfolio/core/theme/app_color_tokens.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';
import 'package:portfolio/core/widgets/app_nav_footer.dart';
import 'package:portfolio/core/widgets/app_nav_header.dart';
import 'package:portfolio/features/projects_page/controller/projects_controller.dart';
import 'package:portfolio/features/projects_page/models/project_model.dart';

class DesktopProjectsView extends ConsumerStatefulWidget {
  const DesktopProjectsView({super.key});

  @override
  ConsumerState<DesktopProjectsView> createState() => _DesktopProjectsViewState();
}

class _DesktopProjectsViewState extends ConsumerState<DesktopProjectsView> {
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
        padding: EdgeInsets.fromLTRB(95.w, 54.h, 40.w, 23.h),
        child: Stack(
          children: [
            Positioned.fill(
              child: IgnorePointer(
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: hoveredProject == null
                        ? const SizedBox.shrink(key: ValueKey('no-preview'))
                        : _ProjectPreview(key: ValueKey(hoveredProject.id), project: hoveredProject),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                AppNavHeader(),
                Gap(180.h),
                Hero(
                  tag: 'projects',
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 250),
                    style: AppTextStyles.pageTitle(context).copyWith(color: fg),
                    child: const Text('Projects'),
                  ),
                ),
                Gap(100.h),
                SizedBox(
                  height: 395.h,
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 10.h),
                    itemBuilder: (context, index) {
                      final project = con.projects[index];
                      return Container(
                        padding: EdgeInsets.only(bottom: 50.h),
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
                                    borderRadius: BorderRadius.circular(12.r),
                                    child: Image.asset(
                                      project.iconAsset,
                                      width: 48.w,
                                      height: 48.w,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Gap(20.w),
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
                const Spacer(),
                AppNavFooter(current: AppNavItem.projects, colorOverride: fg),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// The hovered project's screenshot/mockup, centred behind the list. Dimmed
/// so the project names stay readable. Renders nothing when the project has
/// no `<id>_preview.png` asset yet.
class _ProjectPreview extends StatelessWidget {
  const _ProjectPreview({super.key, required this.project});
  final ProjectModel project;

  static const double _opacity = 0.35;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _opacity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.r),
        child: Image.asset(
          AppAssets.projectPreview(project.id),
          height: MediaQuery.sizeOf(context).height * 0.6,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
        ),
      ),
    );
  }
}
