import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';

class DesktopLoadingView extends StatefulWidget {
  const DesktopLoadingView({super.key});

  @override
  State<DesktopLoadingView> createState() => _DesktopLoadingViewState();
}

class _DesktopLoadingViewState extends State<DesktopLoadingView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(); // Repeats animation indefinitely
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.rotate(
                    angle: _controller.value * 2 * pi,
                    child: ClipOval(
                      child: Image.asset(
                        AppAssets.avatarVector,
                        width: 300.w,
                        height: 300.w,
                      ),
                    ),
                  ),
                  Gap(20.h),
                  Transform.scale(
                    scale: 1 - 0.5 * sin(_controller.value * 2 * pi),
                    child: Text(
                      'The-Clec.Dev',
                      style: AppTextStyles.devName(context),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
