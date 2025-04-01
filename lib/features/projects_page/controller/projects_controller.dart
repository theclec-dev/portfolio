import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/features/projects_page/models/project_model.dart';

class ProjectsController {
  ProjectsController._internal();
  static final _instance = ProjectsController._internal();
  factory ProjectsController() => _instance;

  final projectNameProvider = StateProvider<String>((ref) {
    return '';
  });

  final colorsProvider = StateProvider<List<Color>>((ref) {
    return [AppColors.white, AppColors.black];
  });

  final projects = [
    ProjectModel(
      name: 'Project 1',
      description: 'Description 1',
      image: 'Image 1',
      url: 'URL 1',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    ProjectModel(
      name: 'Project 2',
      description: 'Description 2',
      image: 'Image 2',
      url: 'URL 2',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    ProjectModel(
      name: 'Project 3',
      description: 'Description 3',
      image: 'Image 3',
      url: 'URL 3',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    ProjectModel(
      name: 'Project 4',
      description: 'Description 4',
      image: 'Image 4',
      url: 'URL 4',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    ProjectModel(
      name: 'Project 5',
      description: 'Description 5',
      image: 'Image 5',
      url: 'URL 5',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    ProjectModel(
      name: 'Project 6',
      description: 'Description 6',
      image: 'Image 6',
      url: 'URL 6',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    ProjectModel(
      name: 'Project 7',
      description: 'Description 7',
      image: 'Image 7',
      url: 'URL 7',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    ProjectModel(
      name: 'Project 8',
      description: 'Description 8',
      image: 'Image 8',
      url: 'URL 8',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    ProjectModel(
      name: 'Project 9',
      description: 'Description 9',
      image: 'Image 9',
      url: 'URL 9',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    ProjectModel(
      name: 'Project 10',
      description: 'Description 10',
      image: 'Image 10',
      url: 'URL 10',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];
}

final projectProvider = StateProvider<ProjectModel?>((ref) => null);
