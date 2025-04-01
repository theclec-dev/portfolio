import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';

class LandingPageController {
  LandingPageController._();
  static final LandingPageController _instance = LandingPageController._();
  factory LandingPageController() => _instance;

  final avatarProvider = StateProvider<String>((ref) {
    return AppAssets.avatarLive;
  });

  final brandFontProvider =
      StateProvider<TextStyle>((ref) => AppTextStyles.brandName);
}
