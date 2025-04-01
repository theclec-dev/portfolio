import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/app.dart';
import 'package:portfolio/features/about_page/view/views/desktop_about_view.dart';
import 'package:portfolio/features/about_page/view/views/mobile_about_view.dart';

@RoutePage()
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveWrapper.of(context)!.isMobile;
    return isMobile ? MobileAboutView() : DesktopAboutView();
  }
}
