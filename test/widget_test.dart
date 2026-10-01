import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:portfolio/app.dart';
import 'package:portfolio/core/theme/app_theme.dart';
import 'package:portfolio/features/about_page/view/pages/about_page.dart';
import 'package:portfolio/features/contact_page/view/pages/contact_page.dart';
import 'package:portfolio/features/landing_page/view/pages/landing_page.dart';
import 'package:portfolio/features/loading_page/view/views/desktop_loading_view.dart';
import 'package:portfolio/features/loading_page/view/views/mobile_loading_view.dart';
import 'package:portfolio/features/project_details_page/view/pages/project_details_page.dart';
import 'package:portfolio/features/projects_page/data/projects_data.dart';
import 'package:portfolio/features/projects_page/view/pages/projects_page.dart';

/// Pumps several discrete frames instead of one large time jump, so
/// widgets that lazily mount a fresh `flutter_animate` effect in response
/// to another timer firing (e.g. ScrollReveal reacting to
/// VisibilityDetector) get a chance to schedule *and* clear their own
/// timers before the test ends. Safe for pages with infinitely-repeating
/// animations too, since AnimationController tickers (unlike these
/// one-shot delay timers) are cleaned up on widget disposal.
Future<void> pumpSettleQuick(WidgetTester tester) async {
  for (var i = 0; i < 8; i++) {
    await tester.pump(const Duration(milliseconds: 300));
  }
}

Widget harness(Widget child, {bool isMobile = false}) {
  return ProviderScope(
    child: ScreenUtilInit(
      designSize: isMobile ? const Size(345, 850) : const Size(1920, 1080),
      child: MaterialApp(
        theme: AppThemes.lightTheme,
        home: ResponsiveWrapper(
          isMobile: isMobile,
          child: child,
        ),
      ),
    ),
  );
}

void main() {
  // visibility_detector debounces its callbacks on a real Timer; disabling
  // that in tests (per the package's own guidance) avoids pending-timer
  // teardown failures from ScrollReveal's VisibilityDetector usage.
  setUpAll(() {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
  });

  for (final isMobile in [false, true]) {
    final label = isMobile ? 'mobile' : 'desktop';

    testWidgets('Loading view builds ($label)', (tester) async {
      await tester.pumpWidget(
        harness(isMobile ? const MobileLoadingView() : const DesktopLoadingView(), isMobile: isMobile),
      );
      await pumpSettleQuick(tester);
      expect(find.text('CLEC.Dev'), findsOneWidget);
    });

    testWidgets('Landing page builds ($label)', (tester) async {
      await tester.pumpWidget(harness(const LandingPage(), isMobile: isMobile));
      await pumpSettleQuick(tester);
      expect(find.text('Chukwuebuka Charles Enemuoh'), findsOneWidget);
    });

    testWidgets('Projects page builds ($label)', (tester) async {
      await tester.pumpWidget(harness(const ProjectsPage(), isMobile: isMobile));
      await pumpSettleQuick(tester);
      expect(find.text('Projects'), findsOneWidget);
      expect(find.text(kProjects.first.name), findsOneWidget);
    });

    testWidgets('Project details page builds ($label)', (tester) async {
      await tester.pumpWidget(
        harness(ProjectDetailsPage(project: kProjects.first), isMobile: isMobile),
      );
      await pumpSettleQuick(tester);
      expect(find.text(kProjects.first.name), findsOneWidget);
    });

    testWidgets('About page builds with real content, no Placeholder ($label)', (tester) async {
      await tester.pumpWidget(harness(const AboutPage(), isMobile: isMobile));
      await pumpSettleQuick(tester);
      expect(find.byType(Placeholder), findsNothing);
      expect(find.textContaining('Flutter'), findsOneWidget);
    });

    testWidgets('Contact page builds with real content, no Placeholder ($label)', (tester) async {
      await tester.pumpWidget(harness(const ContactPage(), isMobile: isMobile));
      await pumpSettleQuick(tester);
      expect(find.byType(Placeholder), findsNothing);
      expect(find.text('c.enemuoh97@gmail.com'), findsOneWidget);
    });
  }
}
