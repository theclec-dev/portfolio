import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/app.dart';
import 'package:portfolio/core/router/app_router.dart';
import 'package:portfolio/features/loading_page/view/views/desktop_loading_view.dart';
import 'package:portfolio/features/loading_page/view/views/mobile_loading_view.dart';

@RoutePage()
class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveWrapper.of(context)!.isMobile;
    return isMobile ? MobileLoadingView() : DesktopLoadingView();
  }

  void _navigateToNext() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    _goToLandingPage();
  }

  void _goToLandingPage() {
    context.replaceRoute(LandingRoute());
  }
}
