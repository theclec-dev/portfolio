import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/app.dart';
import 'package:portfolio/features/landing_page/view/views/desktop_landing_view.dart';
import 'package:portfolio/features/landing_page/view/views/mobile_landing_view.dart';

@RoutePage()
class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveWrapper.of(context)!.isMobile;
    return isMobile ? MobileLandingView() : DesktopLandingView();
  }
}
