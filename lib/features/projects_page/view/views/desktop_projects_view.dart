import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/core/router/app_router.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';
import 'package:portfolio/features/projects_page/controller/projects_controller.dart';

class DesktopProjectsView extends ConsumerWidget {
  DesktopProjectsView({super.key});

  final con = ProjectsController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backgroundColor = ref.watch(con.colorsProvider);
    final project = ref.watch(con.projectNameProvider);

    return Scaffold(
      backgroundColor: backgroundColor[0],
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          95.w,
          54.h,
          40.w,
          23.h,
        ),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 87.h),
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: List.generate(
                      9,
                      (index) {
                        return Padding(
                          padding: EdgeInsets.only(top: 51.h),
                          child: Text(
                            project,
                            style: TextStyle(color: backgroundColor[1]),
                          ),
                        );
                      },
                    ),
                  ),
                  Gap(20.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: List.generate(
                      9,
                      (index) {
                        return Padding(
                          padding: EdgeInsets.only(top: 51.h),
                          child: Text(
                            project,
                            style: TextStyle(color: backgroundColor[1]),
                          ),
                        );
                      },
                    ),
                  ),
                  Gap(376.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: List.generate(
                      9,
                      (index) {
                        return Padding(
                          padding: EdgeInsets.only(top: 51.h),
                          child: Text(
                            project,
                            style: TextStyle(color: backgroundColor[1]),
                          ),
                        );
                      },
                    ),
                  ),
                  Gap(20.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: List.generate(
                      9,
                      (index) {
                        return Padding(
                          padding: EdgeInsets.only(top: 51.h),
                          child: Text(
                            project,
                            style: TextStyle(color: backgroundColor[1]),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Column(
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
                        Gap(20.w),
                        Hero(
                          tag: 'brand_name',
                          child: Text(
                            'CLEC.dev',
                            style: AppTextStyles.brandName(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(180.h),
                Hero(
                  tag: 'projects',
                  child: Text(
                    'Projects',
                    style: AppTextStyles.pageTitle(context).copyWith(
                      color: backgroundColor[1],
                    ),
                  ),
                ),
                Gap(100.h),
                SizedBox(
                  height: 395.h,
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 10.h),
                    itemBuilder: (context, index) => GestureDetector(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 50.h),
                        child: Center(
                          child: MouseRegion(
                            onEnter: (event) {
                              ref.read(con.projectNameProvider.notifier).state =
                                  con.projects[index].name;
                              ref.read(con.colorsProvider.notifier).state = [
                                AppColors.black,
                                AppColors.white
                              ];
                            },
                            onExit: (event) {
                              ref.read(con.projectNameProvider.notifier).state =
                                  '';
                              ref.read(con.colorsProvider.notifier).state = [
                                AppColors.white,
                                AppColors.black
                              ];
                            },
                            child: GestureDetector(
                              onTap: () {
                                ref.read(projectProvider.notifier).state =
                                    con.projects[index];
                                context.pushRoute(
                                  ProjectDetailsRoute(
                                    project: con.projects[index],
                                  ),
                                );
                              },
                              child: Text(
                                con.projects[index].name,
                                // textAlign: TextAlign.center,
                                style:
                                    AppTextStyles.projectName(context).copyWith(
                                  color: backgroundColor[1],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    itemCount: con.projects.length,
                  ),
                ),
                const Spacer(),
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
                            color: backgroundColor[1],
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
                          color: backgroundColor[1],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
