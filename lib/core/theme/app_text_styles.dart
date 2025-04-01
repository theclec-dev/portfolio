// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/core/theme/app_colors.dart';

class AppTextStyles {
  static TextStyle pageTitle = TextStyle(
    fontSize: 96.spMin,
    color: AppColors.black,
    fontWeight: FontWeight.w600,
    fontFamily: AppAssets.archivo,
    height: (38.4 / 96).spMin,
  );

  static TextStyle homeTitle = TextStyle(
    fontSize: 48.spMin,
    color: AppColors.black,
    fontWeight: FontWeight.w800,
    fontFamily: AppAssets.archivo,
    height: (38.4 / 48).spMin,
  );

  static TextStyle brandName = TextStyle(
    fontFamily: AppAssets.offBit,
    fontSize: 24.spMin,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
    height: (38.4 / 24).spMin,
  );

  static TextStyle brandNameHover = brandName.copyWith(
    fontFamily: AppAssets.offBitDot,
    fontWeight: FontWeight.w600,
  );

  static TextStyle devName = TextStyle(
    fontSize: 48.spMin,
    color: AppColors.black,
    fontWeight: FontWeight.w800,
    fontFamily: AppAssets.archivo,
    height: (38.4 / 48).spMin,
  );

  static TextStyle section = TextStyle(
    fontSize: 24.spMin,
    color: AppColors.black,
    fontWeight: FontWeight.w600,
    fontFamily: AppAssets.archivo,
    height: (38.4 / 24).spMin,
  );

  static TextStyle projectName = TextStyle(
    fontSize: 48.spMin,
    color: AppColors.black,
    fontWeight: FontWeight.w600,
    fontFamily: AppAssets.archivo,
    height: (38.4 / 48).spMin,
  );

  static TextStyle bodyRegular = TextStyle(
    fontSize: 48.spMin,
    color: AppColors.black,
    fontWeight: FontWeight.w600,
    fontFamily: AppAssets.archivo,
    height: (52 / 48).spMin,
  );
}
