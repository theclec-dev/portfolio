import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/router/app_router.dart';
import 'package:portfolio/core/theme/app_theme.dart';
import 'package:portfolio/core/theme/theme_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResponsiveApp extends ConsumerStatefulWidget {
  const ResponsiveApp(
      {super.key, required this.constraints, required this.appRouter});
  final BoxConstraints constraints;
  final AppRouter appRouter;

  @override
  ConsumerState<ResponsiveApp> createState() => _ResponsiveAppState();
}

class _ResponsiveAppState extends ConsumerState<ResponsiveApp> {
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
    ref.listen(ThemeController().themeModeProvider, (previous, next) {
      if (previous != null && previous != next) {
        SharedPreferences.getInstance()
            .then((prefs) => prefs.setString(themeModePrefsKey, themeModeToPrefs(next)));
      }
    });
    final themeMode = ref.watch(ThemeController().themeModeProvider);

    return ScreenUtilInit(
      designSize: isMobile ? const Size(345, 850) : const Size(1920, 1080),
      child: MaterialApp.router(
        routerConfig: widget.appRouter.config(),
        title: 'CLEC.Dev',
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: themeMode,
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
