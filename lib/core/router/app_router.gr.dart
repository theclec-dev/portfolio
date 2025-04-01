// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AboutPage]
class AboutRoute extends PageRouteInfo<void> {
  const AboutRoute({List<PageRouteInfo>? children})
    : super(AboutRoute.name, initialChildren: children);

  static const String name = 'AboutRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AboutPage();
    },
  );
}

/// generated route for
/// [ContactPage]
class ContactRoute extends PageRouteInfo<void> {
  const ContactRoute({List<PageRouteInfo>? children})
    : super(ContactRoute.name, initialChildren: children);

  static const String name = 'ContactRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ContactPage();
    },
  );
}

/// generated route for
/// [LandingPage]
class LandingRoute extends PageRouteInfo<void> {
  const LandingRoute({List<PageRouteInfo>? children})
    : super(LandingRoute.name, initialChildren: children);

  static const String name = 'LandingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LandingPage();
    },
  );
}

/// generated route for
/// [LoadingPage]
class LoadingRoute extends PageRouteInfo<void> {
  const LoadingRoute({List<PageRouteInfo>? children})
    : super(LoadingRoute.name, initialChildren: children);

  static const String name = 'LoadingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoadingPage();
    },
  );
}

/// generated route for
/// [ProjectDetailsPage]
class ProjectDetailsRoute extends PageRouteInfo<ProjectDetailsRouteArgs> {
  ProjectDetailsRoute({
    Key? key,
    required ProjectModel project,
    List<PageRouteInfo>? children,
  }) : super(
         ProjectDetailsRoute.name,
         args: ProjectDetailsRouteArgs(key: key, project: project),
         initialChildren: children,
       );

  static const String name = 'ProjectDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProjectDetailsRouteArgs>();
      return ProjectDetailsPage(key: args.key, project: args.project);
    },
  );
}

class ProjectDetailsRouteArgs {
  const ProjectDetailsRouteArgs({this.key, required this.project});

  final Key? key;

  final ProjectModel project;

  @override
  String toString() {
    return 'ProjectDetailsRouteArgs{key: $key, project: $project}';
  }
}

/// generated route for
/// [ProjectsPage]
class ProjectsRoute extends PageRouteInfo<void> {
  const ProjectsRoute({List<PageRouteInfo>? children})
    : super(ProjectsRoute.name, initialChildren: children);

  static const String name = 'ProjectsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProjectsPage();
    },
  );
}
