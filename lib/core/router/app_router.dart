import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/features/about_page/view/pages/about_page.dart';
import 'package:portfolio/features/contact_page/view/pages/contact_page.dart';
import 'package:portfolio/features/landing_page/view/pages/landing_page.dart';
import 'package:portfolio/features/loading_page/view/pages/loading_page.dart';
import 'package:portfolio/features/project_details_page/view/pages/project_details_page.dart';
import 'package:portfolio/features/projects_page/view/pages/projects_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  
  

  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(
          page: LoadingRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: LandingRoute.page,
          type: RouteType.custom(customRouteBuilder: customRouteBuilder),
        ),
        AutoRoute(page: ProjectsRoute.page),
        AutoRoute(page: ProjectDetailsRoute.page),
        AutoRoute(page: AboutRoute.page),
        AutoRoute(page: ContactRoute.page),
      ];
}

Route<T> customRouteBuilder<T>(
  BuildContext context,
  Widget child,
  AutoRoutePage<T> page,
) {
  return PageRouteBuilder(
    fullscreenDialog: page.fullscreenDialog,
    settings: page,
    transitionsBuilder: TransitionsBuilders.slideBottom,
    transitionDuration: const Duration(milliseconds: 600),
    pageBuilder: (context, __, ___) {
      return child;
    },
  );
}
