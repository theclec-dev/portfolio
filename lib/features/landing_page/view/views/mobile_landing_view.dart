import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/core/router/app_router.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';
import 'package:portfolio/features/landing_page/controller/landing_page_controller.dart';

class MobileLandingView extends ConsumerStatefulWidget {
  const MobileLandingView({super.key});

  @override
  ConsumerState<MobileLandingView> createState() => _MobileLandingViewState();
}

class _MobileLandingViewState extends ConsumerState<MobileLandingView> {
  final con = LandingPageController();
  @override
  Widget build(BuildContext context) {
    final avatar = ref.watch(con.avatarProvider);
    final brandFont = ref.watch(con.brandFontProvider);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12.w),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MouseRegion(
                  onEnter: (_) {
                    ref.read(con.avatarProvider.notifier).state =
                        AppAssets.avatarVector;
                    ref.read(con.brandFontProvider.notifier).state = true;
                  },
                  onExit: (_) {
                    ref.read(con.avatarProvider.notifier).state =
                        AppAssets.avatarLive;
                    ref.read(con.brandFontProvider.notifier).state = false;
                  },
                  child: Hero(
                    tag: 'avatar',
                    child: ClipOval(
                      child: Image.asset(
                        avatar,
                        width: 120.w,
                        height: 120.w,
                      ),
                    ),
                  ),
                ),
                Gap(37.h),
                Text(
                  'Chukwuebuka Charles Enemuoh',
                  style: AppTextStyles.devName(context),
                  textAlign: TextAlign.center,
                ),
                Gap(11.h),
                MouseRegion(
                  onEnter: (_) {
                    ref.read(con.avatarProvider.notifier).state =
                        AppAssets.avatarVector;
                    ref.read(con.brandFontProvider.notifier).state = true;
                  },
                  onExit: (_) {
                    ref.read(con.avatarProvider.notifier).state =
                        AppAssets.avatarLive;
                    ref.read(con.brandFontProvider.notifier).state = false;
                  },
                  child: Hero(
                    tag: 'brand_name',
                    child: Text(
                      'CLEC.Dev',
                      style: brandFont
                          ? AppTextStyles.brandNameHover(context)
                          : AppTextStyles.brandName(context),
                    ),
                  ),
                ),
                Gap(24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Hero(
                      tag: 'projects',
                      child: GestureDetector(
                        onTap: () {
                          context.pushRoute(ProjectsRoute());
                        },
                        child: Text(
                          'Projects',
                          style: AppTextStyles.section(context),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.pushRoute(AboutRoute());
                      },
                      child: Hero(
                        tag: 'about',
                        child: Text(
                          'About',
                          style: AppTextStyles.section(context),
                        ),
                      ),
                    ),
                    Hero(
                      tag: 'contact',
                      child: Text(
                        'Contact',
                        style: AppTextStyles.section(context),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
