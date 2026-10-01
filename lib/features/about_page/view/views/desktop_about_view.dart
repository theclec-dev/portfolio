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

class DesktopAboutView extends StatelessWidget {
  const DesktopAboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(95.w, 54.h, 40.w, 23.h),
        child: Column(
          children: [
            const AppNavHeader(),
            Gap(180.h),
            Hero(
              tag: 'about',
              child: Text(
                'About',
                style: AppTextStyles.pageTitle(context),
              ),
            ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.1, end: 0),
            Gap(100.h),
            ScrollReveal(
              revealKey: 'about-bio',
              child: Text(
                _bio,
                style: AppTextStyles.bodyRegular(context),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            AppNavFooter(current: AppNavItem.about),
          ],
        ),
      ),
    );
  }
}
