import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_routes_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardBottomNavigatePage extends StatelessWidget {
  const DashboardBottomNavigatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          bottom: size.width * .010,
          child: Container(
            width: size.width,
            height: size.width / 6.9,
            color: CustomColorsTheme.coklat,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * .075),
            width: size.width,
            height: size.width / 7,
            color: CustomColorsTheme.hijauNavi,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(CustomRoutesPage.tranksaksiImportant,preventDuplicates: false);
                  },
                  child: Text(
                    'Tranksaksi',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: size.width * .04,
                      fontWeight: FontWeight.bold,
                      color: CustomColorsTheme.coklat,
                    ),
                  ),
                ),
                Text(
                  'Laporan',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: size.width * .04,
                    fontWeight: FontWeight.bold,
                    color: CustomColorsTheme.coklat,
                  ),
                ),
              ],
            ),
          ),
        ),
         Positioned(
          left: 0,
          right: 0,
          bottom: size.width * .04,
          child: CircleAvatar(
            radius: size.width * .105,
            backgroundColor: CustomColorsTheme.coklat,
          )
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: size.width * .05,
          child: CircleAvatar(
            radius: size.width * .095,
            backgroundColor: CustomColorsTheme.hijauNavi,
            child: Icon(Icons.add_shopping_cart,color: CustomColorsTheme.coklat,size: size.width * .075,),
          )
        ),
      ],
    );
  }
}
