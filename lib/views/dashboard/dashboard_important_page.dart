import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:apk_kasir_by_dante/views/dashboard/dashboard_body_page.dart';
import 'package:apk_kasir_by_dante/views/dashboard/dashboard_bottom_navigate_page.dart';
import 'package:apk_kasir_by_dante/views/dashboard/dashboard_top_navigate_page.dart';
import 'package:flutter/material.dart';

class DashboardImportantPage extends StatelessWidget {
  const DashboardImportantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomColorsTheme.cream,
      body: Stack(
        children: [
          // Body Section
          DashboardBodyPage(),

          // Top Section
          DashboardTopNavigatePage(),

          // Bottom Section
          DashboardBottomNavigatePage(),
        ],
      ),
    );
  }
}
