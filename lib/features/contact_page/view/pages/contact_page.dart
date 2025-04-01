import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/app.dart';
import 'package:portfolio/features/contact_page/view/views/desktop_contact_view.dart';
import 'package:portfolio/features/contact_page/view/views/mobile_contact_view.dart';

@RoutePage()
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveWrapper.of(context)!.isMobile;
    return isMobile ? MobileContactView() : DesktopContactView();
  }
}