/// Engineering notes for a project, shown on its details page. Every field is
/// optional: a row or list with no data is simply not rendered, so a project
/// only shows what has actually been verified against its source.
class ProjectTechDetails {
  const ProjectTechDetails({
    this.role,
    this.architecture,
    this.stateManagement,
    this.routing,
    this.networking,
    this.storage,
    this.techStack = const [],
    this.highlights = const [],
  });

  /// The owner's part in the project, e.g. sole developer.
  final String? role;
  final String? architecture;
  final String? stateManagement;
  final String? routing;
  final String? networking;
  final String? storage;

  /// Short tool/library names rendered as chips.
  final List<String> techStack;

  /// Other engineering points worth a recruiter's attention (security,
  /// environments, integrations, platform features...).
  final List<String> highlights;

  /// The labelled rows, in display order, skipping any with no data.
  List<({String label, String value})> get rows => [
        if (role != null) (label: 'Role', value: role!),
        if (architecture != null) (label: 'Architecture', value: architecture!),
        if (stateManagement != null) (label: 'State management', value: stateManagement!),
        if (routing != null) (label: 'Routing', value: routing!),
        if (networking != null) (label: 'Networking', value: networking!),
        if (storage != null) (label: 'Storage & config', value: storage!),
      ];

  bool get isEmpty => rows.isEmpty && techStack.isEmpty && highlights.isEmpty;
}

class ProjectModel {
  final String id;
  final String name;
  final String description;
  final String iconAsset;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final ProjectTechDetails? techDetails;

  ProjectModel({
    required this.id,
    required this.name,
    required this.description,
    required this.iconAsset,
    this.playStoreUrl,
    this.appStoreUrl,
    this.techDetails,
  }) : assert(playStoreUrl != null || appStoreUrl != null);
}
