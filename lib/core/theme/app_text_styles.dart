// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/app.dart';
import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/core/theme/app_colors.dart';

class AppTextStyles {
  static bool isMobile(BuildContext context){
    return ResponsiveWrapper.of(context)!.isMobile;
  }
  // final isMobile = ResponsiveWrapper.of(context)!.isMobile;
   static TextStyle pageTitle(BuildContext context) => TextStyle(
    fontSize: isMobile(context) ? 38.spMin : 96.spMin ,
    color: AppColors.black,
    fontWeight: FontWeight.w600,
    fontFamily: AppAssets.archivo,
    height: (38.4 / 96).spMin,
  );

  static TextStyle homeTitle(BuildContext context) => TextStyle(
    fontSize: isMobile(context)? 24.spMin : 48.spMin,
    color: AppColors.black,
    fontWeight: FontWeight.w800,
    fontFamily: AppAssets.archivo,
    height: (38.4 / 48).spMin,
  );

  static TextStyle brandName(BuildContext context) => TextStyle(
    fontFamily: AppAssets.offBit,
    fontSize: isMobile(context)? 16.spMin : 24.spMin,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
    height: (38.4 / 24).spMin,
  );

  static TextStyle brandNameHover(BuildContext context) => brandName(context).copyWith(
    fontFamily: AppAssets.offBitDot,
    fontWeight: FontWeight.w600,
  );

  static TextStyle devName(BuildContext context) => TextStyle(
    fontSize: isMobile(context) ? 24.spMin : 48.spMin,
    color: AppColors.black,
    fontWeight: FontWeight.w800,
    fontFamily: AppAssets.archivo,
    height: (38.4 / 48).spMin,
  );

  static TextStyle section(BuildContext context) => TextStyle(
    fontSize:isMobile(context)? 14.spMin  : 24.spMin,
    color: AppColors.black,
    fontWeight: FontWeight.w600,
    fontFamily: AppAssets.archivo,
    height: (38.4 / 24).spMin,
  );

  static TextStyle projectName(BuildContext context) => TextStyle(
    fontSize:isMobile(context)? 24.spMin  : 48.spMin,
    color: AppColors.black,
    fontWeight: FontWeight.w600,
    fontFamily: AppAssets.archivo,
    height: (38.4 / 48).spMin,
  );

  static TextStyle bodyRegular(BuildContext context) => TextStyle(
    fontSize: isMobile(context)? 24.spMin  : 48.spMin,
    color: AppColors.black,
    fontWeight: FontWeight.w600,
    fontFamily: AppAssets.archivo,
    height: (52 / 48).spMin,
  );
}
