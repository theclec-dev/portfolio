import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/router/app_router.dart';

class DesktopAboutView extends StatelessWidget {
  const DesktopAboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          95.w,
          54.h,
          40.w,
          23.h,
        ),
        child: Column(
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
                        style: AppTextStyles.brandName,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gap(180.h),
            Hero(
              tag: 'about',
              child: Text(
                'About',
                style: AppTextStyles.pageTitle,
              ),
            ),
            Gap(100.h),
            Text(
              'German Machine is a Flutter Dev know for his machine like speed at coding and debugging. He is also an Elder and Hoeless',
              style: AppTextStyles.bodyRegular,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => context.replaceRoute(ProjectsRoute()),
                  child: Hero(
                    tag: 'projects',
                    child: Text(
                      'Projects',
                      style: AppTextStyles.section,
                    ),
                  ),
                ),
                Gap(50.w),
                GestureDetector(
                  onTap: () => context.replaceRoute(ContactRoute()),
                  child: Hero(
                    tag: 'contact',
                    child: Text(
                      'Contact',
                      style: AppTextStyles.section,
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
