import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/core/constants/assets.dart';

/// Shared avatar centerpiece, tied together across routes via
/// `Hero(tag: 'avatar')`. [AvatarMotion.spin] is used while the Loading page
/// is active; [AvatarMotion.breathe] is the idle state the Landing page
/// settles into once the page transition completes.
enum AvatarMotion { spin, breathe }

class AnimatedAvatar extends StatelessWidget {
  const AnimatedAvatar({
    super.key,
    required this.size,
    this.motion = AvatarMotion.breathe,
    this.image,
  });

  final double size;
  final AvatarMotion motion;
  final String? image;

  @override
  Widget build(BuildContext context) {
    final avatar = Hero(
      tag: 'avatar',
      child: ClipOval(
        child: Image.asset(
          image ?? AppAssets.avatarVector,
          width: size,
          height: size,
          fit: BoxFit.cover,
        ),
      ),
    );

    switch (motion) {
      case AvatarMotion.spin:
        return avatar
            .animate(onPlay: (controller) => controller.repeat())
            .rotate(duration: 3.seconds, curve: Curves.linear);
      case AvatarMotion.breathe:
        return avatar
            .animate(onPlay: (controller) => controller.repeat(reverse: true))
            .scale(
              begin: const Offset(1, 1),
              end: const Offset(1.04, 1.04),
              duration: 1800.ms,
              curve: Curves.easeInOut,
            );
    }
  }
}
