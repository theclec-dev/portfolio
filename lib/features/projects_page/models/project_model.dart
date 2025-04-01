class ProjectModel {
  final String name;
  final String description;
  final String image;
  final String url;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ProjectModel({
    required this.name,
    required this.description,
    required this.image,
    required this.url,
    this.createdAt,
    this.updatedAt,
  });
}
