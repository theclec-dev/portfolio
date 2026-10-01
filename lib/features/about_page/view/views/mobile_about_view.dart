import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';
import 'package:portfolio/core/widgets/app_nav_footer.dart';
import 'package:portfolio/core/widgets/app_nav_header.dart';
import 'package:portfolio/core/widgets/scroll_reveal.dart';

const _bio =
    'With over 5 years of active experience in mobile development using Flutter, I am committed to '
    'delivering high quality projects. Known for collaborating effectively with others, I welcome '
    'feedback as an opportunity to gain experience and continuously seek ways to improve my skills. '
    'My previous experience demonstrates my dedication to producing purposeful work. I approach every '
    'project with enthusiasm and a focus on contributing positively to its success.';

class MobileAboutView extends StatelessWidget {
  const MobileAboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          children: [
            AppNavHeader(avatarRadius: 20.r, gap: 8.w),
            Gap(32.h),
            Hero(
              tag: 'about',
              child: Text(
                'About',
                style: AppTextStyles.pageTitle(context),
              ),
            ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.1, end: 0),
            Gap(32.h),
            Expanded(
              child: SingleChildScrollView(
                child: ScrollReveal(
                  revealKey: 'about-bio-mobile',
                  child: Text(
                    _bio,
                    style: AppTextStyles.bodyRegular(context).copyWith(fontSize: 16.spMin),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            AppNavFooter(current: AppNavItem.about, gap: 24.w),
          ],
        ),
      ),
    );
  }
}
