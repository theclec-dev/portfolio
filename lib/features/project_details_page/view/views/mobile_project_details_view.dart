import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/core/router/app_router.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';
import 'package:portfolio/features/projects_page/models/project_model.dart';

class MobileProjectDetailsView extends ConsumerStatefulWidget {
  const MobileProjectDetailsView({super.key, required this.project});
  final ProjectModel project;

  @override
  ConsumerState<MobileProjectDetailsView> createState() =>
      _MobileProjectDetailsViewState();
}

class _MobileProjectDetailsViewState
    extends ConsumerState<MobileProjectDetailsView> {
  @override
  Widget build(BuildContext context) {
    final project = widget.project;
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          children: [
            Row(
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
                            radius: 20.r,
                            backgroundImage: AssetImage(AppAssets.avatarVector),
                          ),
                        ),
                        Gap(8.w),
                        Hero(
                          tag: 'brand_name',
                          child: Text(
                            'CLEC.dev',
                            style: AppTextStyles.brandName(context).copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => context.replaceRoute(ProjectsRoute()),
                  child: Hero(
                    tag: 'projects',
                    child: Text(
                      'Projects',
                      style: AppTextStyles.section(context).copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Gap(32.h),
                    Text(
                      project.name,
                      style: AppTextStyles.pageTitle(context).copyWith(
                        color: AppColors.white,
                        fontSize: 30.spMin,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Gap(24.h),
                    Text(
                      project.description,
                      style: AppTextStyles.projectName(context).copyWith(
                        height: (54 / 48).spMin,
                        color: AppColors.white,
                      ),
                    ),
                    Gap(24.h),
                    Image.asset(
                      AppAssets.photo,
                    ),
                    Gap(39.h),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => context.replaceRoute(AboutRoute()),
                  child: Hero(
                    tag: 'about',
                    child: Text(
                      'About',
                      style: AppTextStyles.section(context).copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                Gap(50.w),
                Hero(
                  tag: 'contact',
                  child: Text(
                    'Contact',
                    style: AppTextStyles.section(context).copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
