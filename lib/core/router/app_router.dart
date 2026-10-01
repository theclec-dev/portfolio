import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/features/about_page/view/pages/about_page.dart';
import 'package:portfolio/features/contact_page/view/pages/contact_page.dart';
import 'package:portfolio/features/landing_page/view/pages/landing_page.dart';
import 'package:portfolio/features/loading_page/view/pages/loading_page.dart';
import 'package:portfolio/features/project_details_page/view/pages/project_details_page.dart';
import 'package:portfolio/features/projects_page/models/project_model.dart';
import 'package:portfolio/features/projects_page/view/pages/projects_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LoadingRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: LandingRoute.page,
          type: RouteType.custom(customRouteBuilder: fadeScaleRouteBuilder),
        ),
        AutoRoute(
          page: ProjectsRoute.page,
          type: RouteType.custom(customRouteBuilder: fadeScaleRouteBuilder),
        ),
        AutoRoute(
          page: ProjectDetailsRoute.page,
          type: RouteType.custom(customRouteBuilder: fadeRouteBuilder),
        ),
        AutoRoute(
          page: AboutRoute.page,
          type: RouteType.custom(customRouteBuilder: lateralRouteBuilder),
        ),
        AutoRoute(
          page: ContactRoute.page,
          type: RouteType.custom(customRouteBuilder: lateralRouteBuilder),
        ),
      ];
}

/// Zoom-reveal transition: used for Loading->Landing and Landing->Projects,
/// where the destination page reads as the next "centerpiece".
Route<T> fadeScaleRouteBuilder<T>(
  BuildContext context,
  Widget child,
  AutoRoutePage<T> page,
) {
  return PageRouteBuilder(
    fullscreenDialog: page.fullscreenDialog,
    settings: page,
    transitionDuration: const Duration(milliseconds: 500),
    reverseTransitionDuration: const Duration(milliseconds: 350),
    pageBuilder: (context, __, ___) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curved = CurvedAnimation(parent: animation, curve: Curves.easeOutCubic);
      return FadeTransition(
        opacity: curved,
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.94, end: 1).animate(curved),
          child: child,
        ),
      );
    },
  );
}

/// Lateral slide: used for the footer-nav sibling pages (About/Contact).
Route<T> lateralRouteBuilder<T>(
  BuildContext context,
  Widget child,
  AutoRoutePage<T> page,
) {
  return PageRouteBuilder(
    fullscreenDialog: page.fullscreenDialog,
    settings: page,
    transitionDuration: const Duration(milliseconds: 450),
    reverseTransitionDuration: const Duration(milliseconds: 350),
    pageBuilder: (context, __, ___) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curved = CurvedAnimation(parent: animation, curve: Curves.easeOutCubic);
      return FadeTransition(
        opacity: curved,
        child: SlideTransition(
          position: Tween<Offset>(begin: const Offset(0.06, 0), end: Offset.zero).animate(curved),
          child: child,
        ),
      );
    },
  );
}

/// Plain fade: used for Projects->ProjectDetails so it doesn't fight the
/// Hero continuity already carrying the avatar/brand/nav text across.
Route<T> fadeRouteBuilder<T>(
  BuildContext context,
  Widget child,
  AutoRoutePage<T> page,
) {
  return PageRouteBuilder(
    fullscreenDialog: page.fullscreenDialog,
    settings: page,
    transitionDuration: const Duration(milliseconds: 350),
    pageBuilder: (context, __, ___) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}
