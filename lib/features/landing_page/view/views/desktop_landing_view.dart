import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/core/router/app_router.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';
import 'package:portfolio/features/landing_page/controller/landing_page_controller.dart';

class DesktopLandingView extends ConsumerStatefulWidget {
  const DesktopLandingView({super.key});

  @override
  ConsumerState<DesktopLandingView> createState() => _DesktopLandingViewState();
}

class _DesktopLandingViewState extends ConsumerState<DesktopLandingView> {
  final con = LandingPageController();
  @override
  Widget build(BuildContext context) {
    final avatar = ref.watch(con.avatarProvider);
    final isBrandHovered = ref.watch(con.brandFontProvider);
    return Scaffold(
      body: Column(
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
                  width: 190.w,
                  height: 190.w,
                ),
              ),
            ),
          ),
          Gap(37.h),
          Text(
            'Chukwuebuka Charles Enemuoh',
            style: AppTextStyles.devName(context),
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
                'The-Clec.Dev',
                style: isBrandHovered
                    ? AppTextStyles.brandNameHover(context)
                    : AppTextStyles.brandName(context),
              ),
            ),
          ),
          Gap(14.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
              Gap(96.w),
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
              Gap(96.w),
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
    );
  }
}
