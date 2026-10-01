import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/core/router/app_router.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';
import 'package:portfolio/core/widgets/animated_avatar.dart';
import 'package:portfolio/features/landing_page/controller/landing_page_controller.dart';

class MobileLandingView extends ConsumerStatefulWidget {
  const MobileLandingView({super.key});

  @override
  ConsumerState<MobileLandingView> createState() => _MobileLandingViewState();
}

class _MobileLandingViewState extends ConsumerState<MobileLandingView> {
  final con = LandingPageController();

  void _onHover(bool hovered) {
    ref.read(con.avatarProvider.notifier).state =
        hovered ? AppAssets.avatarVector : AppAssets.avatarLive;
    ref.read(con.brandFontProvider.notifier).state = hovered;
  }

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
                  onEnter: (_) => _onHover(true),
                  onExit: (_) => _onHover(false),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: AnimatedAvatar(
                      key: ValueKey(avatar),
                      size: 120.w,
                      image: avatar,
                    ),
                  ),
                ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.15, end: 0),
                Gap(37.h),
                Text(
                  'Chukwuebuka Charles Enemuoh',
                  style: AppTextStyles.devName(context),
                  textAlign: TextAlign.center,
                ).animate(delay: 150.ms).fadeIn(duration: 500.ms).slideY(begin: 0.15, end: 0),
                Gap(11.h),
                MouseRegion(
                  onEnter: (_) => _onHover(true),
                  onExit: (_) => _onHover(false),
                  child: Hero(
                    tag: 'brand_name',
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 250),
                      style: brandFont
                          ? AppTextStyles.brandNameHover(context)
                          : AppTextStyles.brandName(context),
                      child: const Text('CLEC.Dev'),
                    ),
                  ),
                ).animate(delay: 250.ms).fadeIn(duration: 500.ms).slideY(begin: 0.15, end: 0),
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
                    GestureDetector(
                      onTap: () {
                        context.pushRoute(ContactRoute());
                      },
                      child: Hero(
                        tag: 'contact',
                        child: Text(
                          'Contact',
                          style: AppTextStyles.section(context),
                        ),
                      ),
                    ),
                  ],
                ).animate(delay: 350.ms).fadeIn(duration: 500.ms).slideY(begin: 0.15, end: 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
