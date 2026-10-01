class ProjectModel {
  final String id;
  final String name;
  final String description;
  final String iconAsset;
  final String? playStoreUrl;
  final String? appStoreUrl;

  ProjectModel({
    required this.id,
    required this.name,
    required this.description,
    required this.iconAsset,
    this.playStoreUrl,
    this.appStoreUrl,
  }) : assert(playStoreUrl != null || appStoreUrl != null);
}
