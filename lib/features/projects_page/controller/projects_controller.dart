import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/projects_page/data/projects_data.dart';
import 'package:portfolio/features/projects_page/models/project_model.dart';

class ProjectsController {
  ProjectsController._internal();
  static final _instance = ProjectsController._internal();
  factory ProjectsController() => _instance;

  final projectNameProvider = StateProvider<String>((ref) {
    return '';
  });

  /// Whether the page's background/foreground colors are inverted (true
  /// while a project row is hovered). The actual colors are resolved from
  /// the active theme's AppColorTokens, not stored here, so the invert
  /// stays correct in both light and dark mode.
  final invertedProvider = StateProvider<bool>((ref) => false);

  final projects = kProjects;
}

final projectProvider = StateProvider<ProjectModel?>((ref) => null);
