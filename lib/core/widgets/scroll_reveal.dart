import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// Fades/slides [child] in the first time it scrolls into view, then stays
/// revealed (does not replay on every scroll pass).
class ScrollReveal extends StatefulWidget {
  const ScrollReveal({
    super.key,
    required this.child,
    required this.revealKey,
    this.delay = Duration.zero,
  });

  final Widget child;
  final String revealKey;
  final Duration delay;

  @override
  State<ScrollReveal> createState() => _ScrollRevealState();
}

class _ScrollRevealState extends State<ScrollReveal> {
  bool _revealed = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.revealKey),
      onVisibilityChanged: (info) {
        if (!_revealed && info.visibleFraction > 0.15) {
          setState(() => _revealed = true);
        }
      },
      child: _revealed
          ? widget.child
              .animate(delay: widget.delay)
              .fadeIn(duration: 500.ms)
              .slideY(begin: 0.15, end: 0)
          : Opacity(opacity: 0, child: widget.child),
    );
  }
}
