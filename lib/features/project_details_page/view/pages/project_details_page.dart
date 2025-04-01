import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/app.dart';
import 'package:portfolio/features/project_details_page/view/views/desktop_project_details_view.dart';
import 'package:portfolio/features/project_details_page/view/views/mobile_project_details_view.dart';

@RoutePage()
class ProjectDetailsPage extends StatelessWidget {
  const ProjectDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveWrapper.of(context)!.isMobile;
    return isMobile ? MobileProjectDetailsView() : DesktopProjectDetailsView();
  }
}
