import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/constants/assets.dart';

class LandingPageController {
  LandingPageController._();
  static final LandingPageController _instance = LandingPageController._();
  factory LandingPageController() => _instance;

  final avatarProvider = StateProvider<String>((ref) {
    return AppAssets.avatarLive;
  });

  final brandFontProvider = StateProvider<bool>((ref) {
    return false;
  });
}

