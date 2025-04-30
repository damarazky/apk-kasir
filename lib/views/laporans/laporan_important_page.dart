import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_diagram_chart_laporan.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_search_dashboard.dart';
import 'package:apk_kasir_by_dante/views/dashboards/dashboard_bottom_navigate_page.dart';
import 'package:apk_kasir_by_dante/views/dashboards/dashboard_top_navigate_page.dart';
import 'package:flutter/material.dart';

class LaporanImportantPage extends StatelessWidget {
  const LaporanImportantPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColorsTheme.cream,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: size.height * .15),
            padding: EdgeInsets.symmetric(horizontal: size.width * .035),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSearchDashboard(
                  hintText: 'Jenis Laporan',
                  keyboardType: TextInputType.none,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * .02,
                    vertical: size.width * .035,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tanggal Laporan : 25 April 2025',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: CustomColorsTheme.coklat,
                        ),
                      ),
                      Text(
                        'Jenis Laporan : Harian',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: CustomColorsTheme.coklat,
                        ),
                      ),
                      CustomDiagramChartLaporan()
                    ],
                  ),
                ),
              ],
            ),
          ),
          DashboardTopNavigatePage(),
          DashboardBottomNavigatePage(),
        ],
      ),
    );
  }
}
