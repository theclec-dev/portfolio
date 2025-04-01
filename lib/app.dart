import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/router/app_router.dart';
import 'package:portfolio/core/theme/app_theme.dart';

class ResponsiveApp extends StatefulWidget {
  const ResponsiveApp(
      {super.key, required this.constraints, required this.appRouter});
  final BoxConstraints constraints;
  final AppRouter appRouter;

  @override
  State<ResponsiveApp> createState() => _ResponsiveAppState();
}

class _ResponsiveAppState extends State<ResponsiveApp> {
  bool isMobile = false;

  @override
  void initState() {
    super.initState();
    _updateScreenSize(widget.constraints);
  }

  @override
  void didUpdateWidget(covariant ResponsiveApp oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.constraints != widget.constraints) {
      _updateScreenSize(widget.constraints);
    }
  }

  void _updateScreenSize(BoxConstraints constraints) {
    setState(() {
      isMobile = constraints.maxWidth < 600;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: isMobile ? const Size(345, 850) : const Size(1920, 1080),
      child: MaterialApp.router(
        routerConfig: widget.appRouter.config(),
        title: 'Flutter Demo',
        theme: AppThemes.lightTheme,
        builder: (context, child) {
          return ResponsiveWrapper(
            isMobile: isMobile,
            child: child!,
          );
        },
      ),
    );
  }
}

class ResponsiveWrapper extends InheritedWidget {
  final bool isMobile;

  const ResponsiveWrapper({
    super.key,
    required this.isMobile,
    required super.child,
  });

  static ResponsiveWrapper? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ResponsiveWrapper>();
  }

  @override
  bool updateShouldNotify(ResponsiveWrapper oldWidget) {
    return oldWidget.isMobile != isMobile;
  }
}
