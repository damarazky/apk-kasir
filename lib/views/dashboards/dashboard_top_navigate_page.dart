import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_routes_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardTopNavigatePage extends StatelessWidget {
  const DashboardTopNavigatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * .05,
        vertical: size.width * .1,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(
                CustomRoutesPage.dashboardImportant,
                preventDuplicates: false,
              );
            },
            child: Text(
              'Aplikasi\nKasir',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: size.width * 0.05,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                height: size.width * .00225,
                color: CustomColorsTheme.coklat,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Get.toNamed(CustomRoutesPage.settingBody,preventDuplicates: false);
            },
            icon: Icon(
              Icons.settings,
              color: CustomColorsTheme.coklat,
              size: size.width * .075,
            ),
          ),
        ],
      ),
    );
  }
}
