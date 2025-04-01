import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/app.dart';

import 'package:portfolio/core/router/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveApp(
            constraints: constraints,
            appRouter: _appRouter,
          );
        },
      ),
    );
  }
}
