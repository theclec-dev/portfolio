import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:portfolio/core/router/app_router.dart';
import 'package:portfolio/core/theme/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final savedThemeMode = themeModeFromPrefs(prefs.getString(themeModePrefsKey));

  runApp(
    ProviderScope(
      overrides: [
        ThemeController().themeModeProvider.overrideWith((ref) => savedThemeMode),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ResponsiveApp(
          constraints: constraints,
          appRouter: _appRouter,
        );
      },
    );
  }
}
