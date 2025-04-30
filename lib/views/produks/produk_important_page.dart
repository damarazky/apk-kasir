import 'package:apk_kasir_by_dante/views/customs/custom_card_produk.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_search_dashboard.dart';
import 'package:apk_kasir_by_dante/views/dashboards/dashboard_bottom_navigate_page.dart';
import 'package:apk_kasir_by_dante/views/dashboards/dashboard_top_navigate_page.dart';
import 'package:flutter/material.dart';

class ProdukImportantPage extends StatelessWidget {
  const ProdukImportantPage({super.key});

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
                  hintText: 'Cari Produk',
                  keyboardType: TextInputType.none,
                ),
                SizedBox(
                  height: size.height * .7,
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return CustomCardProduk();
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
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: size.width * .175),
        child: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: CustomColorsTheme.hijauNavi,
          onPressed: () {},
          child: Icon(Icons.add, color: CustomColorsTheme.coklat),
        ),
      ),
    );
  }
}
