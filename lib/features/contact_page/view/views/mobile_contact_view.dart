import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:portfolio/core/theme/app_text_styles.dart';
import 'package:portfolio/core/widgets/app_nav_footer.dart';
import 'package:portfolio/core/widgets/app_nav_header.dart';

const _email = 'c.enemuoh97@gmail.com';
const _githubUrl = 'https://github.com/theclec-dev';
const _linkedinUrl = 'https://www.linkedin.com/in/enemuoh-c-c-leo';

class MobileContactView extends StatelessWidget {
  const MobileContactView({super.key});

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
              tag: 'contact',
              child: Text(
                'Contact',
                style: AppTextStyles.pageTitle(context),
              ),
            ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.1, end: 0),
            Gap(48.h),
            Column(
              children: [
                _ContactLink(
                  icon: Icons.email_outlined,
                  label: _email,
                  onTap: () => launchUrl(Uri.parse('mailto:$_email')),
                ),
                Gap(20.h),
                _ContactLink(
                  icon: Icons.code,
                  label: 'GitHub',
                  onTap: () => launchUrl(Uri.parse(_githubUrl), mode: LaunchMode.externalApplication),
                ),
                Gap(20.h),
                _ContactLink(
                  icon: Icons.business_center_outlined,
                  label: 'LinkedIn',
                  onTap: () => launchUrl(Uri.parse(_linkedinUrl), mode: LaunchMode.externalApplication),
                ),
              ],
            ).animate(delay: 150.ms).fadeIn(duration: 500.ms).slideY(begin: 0.1, end: 0),
            const Spacer(),
            AppNavFooter(current: AppNavItem.contact, gap: 24.w),
          ],
        ),
      ),
    );
  }
}

class _ContactLink extends StatelessWidget {
  const _ContactLink({required this.icon, required this.label, required this.onTap});
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 22.sp),
          Gap(10.w),
          Text(label, style: AppTextStyles.bodyRegular(context).copyWith(fontSize: 16.spMin)),
        ],
      ),
    );
  }
}
