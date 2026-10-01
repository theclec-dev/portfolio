# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

A Flutter portfolio site/app ("CLEC.dev") targeting web and desktop/mobile from a single responsive codebase.

## Commands

```bash
flutter pub get                      # install dependencies
flutter run -d chrome                # run on web (primary target)
flutter run                          # run on a connected device/simulator

# auto_route generates part files (app_router.gr.dart) — required after
# adding/editing any @RoutePage() or the routes list in app_router.dart
dart run build_runner build --delete-conflicting-outputs
dart run build_runner watch --delete-conflicting-outputs

flutter analyze                      # static analysis (flutter_lints rules)
flutter test                         # run all tests
flutter test test/widget_test.dart   # run a single test file
```

## Architecture

**Feature-first structure.** Each screen lives under `lib/features/<feature_name>/` with this layout:

```
<feature_name>/
  controller/   # Riverpod state (optional — only where a feature needs shared/reactive state)
  models/       # plain data classes (optional)
  view/
    pages/      # the routed entry widget, annotated @RoutePage()
    views/      # desktop_<feature>_view.dart and mobile_<feature>_view.dart
```

**Responsive split, not responsive widgets.** There is no per-widget breakpoint logic. Instead:
- `lib/app.dart`'s `ResponsiveApp` measures the root `LayoutBuilder` constraints once (mobile breakpoint: `maxWidth < 600`) and exposes the result via the `ResponsiveWrapper` `InheritedWidget`.
- Every page widget in `view/pages/` reads `ResponsiveWrapper.of(context)!.isMobile` and picks between the two dedicated view files (`Mobile*View` / `Desktop*View`) — it does not itself contain responsive layout logic.
- When adding a new screen, follow this exact pattern: a thin `@RoutePage()` page that branches to a `mobile_*_view.dart` and `desktop_*_view.dart`, each implementing the full layout for that form factor independently (they are not expected to share layout code).

**Routing** is `auto_route`-based, configured in `lib/core/router/app_router.dart` (`AppRouter extends RootStackRouter`). Routes are declared in the `routes` getter; `app_router.gr.dart` is generated — never hand-edit it, run build_runner instead. The `LoadingRoute` is the app's `initial: true` route. Route params (e.g. `ProjectDetailsPage`'s `project`) are passed as constructor arguments to the `@RoutePage()` widget, following auto_route's generated-route convention.

**State management** is Riverpod (`flutter_riverpod`). Controllers (e.g. `LandingPageController`, `ProjectsController`) are private-constructor singletons (`factory ProjectsController() => _instance`) exposing `StateProvider`s as instance fields, plus occasional top-level providers (e.g. `projectProvider` in `projects_controller.dart`). This is the existing convention to follow for new feature controllers rather than introducing `NotifierProvider`/other Riverpod patterns.

**Scaling** uses `flutter_screenutil`, initialized in `ResponsiveApp` with two fixed design sizes depending on `isMobile` (`Size(345, 850)` mobile, `Size(1920, 1080)` desktop). Use `.w`/`.h`/`.sp`/`.r` extensions for dimensions in view code so layouts scale correctly against the active design size.

**Core/shared code** lives in `lib/core/`:
- `theme/app_colors.dart`, `app_text_styles.dart`, `app_theme.dart` — `AppThemes.lightTheme`/`darkTheme`, built from `AppColors`.
- `constants/assets.dart` (`AppAssets`) — asset path constants and font family name constants; add new image/icon paths here rather than inlining string literals.
- `constants/app_constants.dart` — small shared helpers (e.g. `deviceWidth`).

**Data**: `ProjectModel` (`lib/features/projects_page/models/project_model.dart`) is currently backed by an in-memory placeholder list in `ProjectsController.projects` — there is no backend/API integration yet.
