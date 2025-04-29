import 'package:apk_kasir_by_dante/views/customs/custom_card_kategori_tranksaksi.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_card_tranksaksi.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_search_dashboard.dart';
import 'package:apk_kasir_by_dante/views/dashboards/dashboard_bottom_navigate_page.dart';
import 'package:apk_kasir_by_dante/views/dashboards/dashboard_top_navigate_page.dart';
import 'package:flutter/material.dart';

class TranksaksiImportantPage extends StatelessWidget {
  const TranksaksiImportantPage({super.key});

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
              children: [
                CustomSearchDashboard(
                  hintText: 'Cari Tranksaksi',
                  keyboardType: TextInputType.none,
                ),
                SizedBox(height: size.width * .05),
                SizedBox(
                  height: size.width * .075,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: size.width * .015),
                        child: CustomCardKategoriTranksaksi(),
                      );
                    },
                  ),
                ),
                                SizedBox(height: size.width * .020),
                SizedBox(
                  height: size.height * .7,
                  child: ListView.builder(
                    itemCount: 20,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CustomCardTranksaksi();
                    },
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
