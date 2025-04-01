import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/theme/app_colors.dart';

class MobileLandingView extends StatefulWidget {
  const MobileLandingView({super.key});

  @override
  State<MobileLandingView> createState() => _MobileLandingViewState();
}

class _MobileLandingViewState extends State<MobileLandingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.avatarVector,
                width: 162.w,
                height: 190.h,
              ),
              Gap(37.h),
              Text(
                'Chukwuebuka Charles Enemuoh',
                style: TextStyle(
                  fontSize: 48.sp,
                  fontWeight: FontWeight.w800,
                  color: AppColors.black,
                ),
              ),
              Gap(11.h),
              Text(
                'The-Clec.Dev',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              ),
              Gap(10.h),
            ],
          ),
        ),
      ),
    );
  }
}
