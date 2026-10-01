import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/features/projects_page/models/project_model.dart';

enum StoreSide { playStore, appStore }

/// A repeating decorative column used as the Projects page's hover
/// background: the official store badge for [side] when the hovered
/// project has a link there, otherwise the project name in a bold display
/// font (covers apps not available on that store, e.g. delisted/unlisted).
class StoreBadgeColumn extends StatelessWidget {
  const StoreBadgeColumn({
    super.key,
    required this.project,
    required this.side,
    required this.color,
    required this.badgeHeight,
    required this.itemGap,
    this.itemCount = 9,
  });

  final ProjectModel? project;
  final StoreSide side;
  final Color color;
  final double badgeHeight;
  final double itemGap;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: List.generate(
        itemCount,
        (_) => Padding(
          padding: EdgeInsets.only(top: itemGap),
          child: _item(),
        ),
      ),
    );
  }

  Widget _item() {
    final current = project;
    if (current == null) {
      return SizedBox(height: badgeHeight);
    }

    final url = side == StoreSide.playStore ? current.playStoreUrl : current.appStoreUrl;
    if (url != null) {
      final badgeAsset = side == StoreSide.playStore ? AppAssets.googlePlayBadge : AppAssets.appStoreBadge;
      return Image.asset(badgeAsset, height: badgeHeight, fit: BoxFit.contain);
    }

    return SizedBox(
      height: badgeHeight,
      child: Center(
        child: Text(
          current.name,
          style: TextStyle(
            color: color,
            fontFamily: AppAssets.offBitDot,
            fontWeight: FontWeight.w700,
            fontSize: badgeHeight * 0.55,
          ),
        ),
      ),
    );
  }
}
