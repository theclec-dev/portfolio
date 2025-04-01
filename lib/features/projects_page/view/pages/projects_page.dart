import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/app.dart';
import 'package:portfolio/features/projects_page/view/views/desktop_projects_view.dart';
import 'package:portfolio/features/projects_page/view/views/mobile_projects_page.dart';

@RoutePage()
class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveWrapper.of(context)!.isMobile;
    return isMobile ? MobileProjectsPage() : DesktopProjectsView();
  }
}
