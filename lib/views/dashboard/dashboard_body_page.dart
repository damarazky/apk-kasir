import 'package:apk_kasir_by_dante/views/customs/custom_card_dashboard.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_search_dashboard.dart';
import 'package:flutter/material.dart';

class DashboardBodyPage extends StatelessWidget {
  const DashboardBodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height * .15),
      padding: EdgeInsets.symmetric(horizontal: size.width * .035),
      width: size.width,
      height: double.infinity,
      child: Column(
        children: [
          CustomSearchDashboard(
            hintText: 'Cari Barang',
            keyboardType: TextInputType.text,
          ),
          Padding(
            padding: EdgeInsets.only(top: size.width * .05),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomCardDashboard(),
                  CustomCardDashboard(),
                  CustomCardDashboard(),
                  CustomCardDashboard(),
                  CustomCardDashboard(),
                  CustomCardDashboard(),
                  CustomCardDashboard(),
                  CustomCardDashboard(),
                  CustomCardDashboard(),
                  CustomCardDashboard(),
                  CustomCardDashboard(),
                  CustomCardDashboard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
