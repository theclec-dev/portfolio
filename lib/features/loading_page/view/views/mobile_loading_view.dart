import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';
import 'package:portfolio/core/widgets/animated_avatar.dart';

class MobileLoadingView extends StatelessWidget {
  const MobileLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedAvatar(size: 100.w, motion: AvatarMotion.spin),
            Gap(20.h),
            Text(
              'CLEC.Dev',
              style: AppTextStyles.devName(context),
            )
                .animate(onPlay: (c) => c.repeat(reverse: true))
                .scale(
                  begin: const Offset(1, 1),
                  end: const Offset(1.08, 1.08),
                  duration: 900.ms,
                  curve: Curves.easeInOut,
                ),
          ],
        ),
      ),
    );
  }
}
