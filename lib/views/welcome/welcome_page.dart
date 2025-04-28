import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_routes_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomColorsTheme.cream,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .1),
            child: Center(
              child: Hero(
                tag: 'welcome-teks',
                child: Text(
                  'Aplikasi Kasir',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: size.width * 0.15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    height: size.width * .00225,
                    color: CustomColorsTheme.coklat,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: size.width * .15,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: CustomColorsTheme.hijauNavi,
                borderRadius: BorderRadius.circular(size.width * .2),
                border: Border.all(
                  width: size.width * .005,
                  color: CustomColorsTheme.coklat,
                ),
              ),
              width: size.width,
              margin: EdgeInsets.symmetric(horizontal: size.width * .1),
              padding: EdgeInsets.symmetric(
                horizontal: size.width * .035,
                vertical: size.width * .015,
              ),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(CustomRoutesPage.login,preventDuplicates: false,);
                },
                child: Center(
                  child: Text(
                    'Mulai',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: size.width * .065,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: CustomColorsTheme.coklat,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
