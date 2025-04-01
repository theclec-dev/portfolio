import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/app.dart';
import 'package:portfolio/features/project_details_page/view/views/desktop_project_details_view.dart';
import 'package:portfolio/features/project_details_page/view/views/mobile_project_details_view.dart';
import 'package:portfolio/features/projects_page/models/project_model.dart';

@RoutePage()
class ProjectDetailsPage extends StatefulWidget {
  const ProjectDetailsPage({super.key, required this.project});
  final ProjectModel project;

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveWrapper.of(context)!.isMobile;
    return isMobile
        ? MobileProjectDetailsView(project: widget.project)
        : DesktopProjectDetailsView(project: widget.project);
  }
}
