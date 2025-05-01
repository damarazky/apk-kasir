import 'package:apk_kasir_by_dante/databases/db_helper.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:apk_kasir_by_dante/views/dashboards/dashboard_top_navigate_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsBodyPage extends StatelessWidget {
  const SettingsBodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColorsTheme.cream,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: size.width * .3),
            padding: EdgeInsets.symmetric(horizontal: size.width * .035),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Backup File Data',
                    style: TextStyle(
                      fontSize: size.width * .04,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: CustomColorsTheme.coklat,
                    ),
                  ),
                ),
                Divider(
                  color: CustomColorsTheme.coklat,
                  thickness: size.width * .005,
                ),
                TextButton(
                  onPressed: () {
                    Get.defaultDialog(
                      title: 'Hapus Data',
                      backgroundColor: CustomColorsTheme.hijauNavi,
                      titleStyle: TextStyle(
                        fontFamily: 'Poppins',
                        color: CustomColorsTheme.coklat,
                        fontWeight: FontWeight.w700,
                      ),
                      middleTextStyle: TextStyle(
                        fontFamily: 'Poppins',
                        color: CustomColorsTheme.coklat,
                      ),
                      middleText: 'Yakin ingin menghapus semua data ini?',
                      textConfirm: 'Ya',
                      buttonColor: CustomColorsTheme.cream,
                      confirmTextColor: CustomColorsTheme.coklat,
                      cancelTextColor: CustomColorsTheme.coklat,
                      textCancel: 'Tidak',
                      onConfirm: () async {
                        await DBHelper().resetDatabase();

                        Get.close();
                      },
                    );
                  },
                  child: Text(
                    'Reset File Data',
                    style: TextStyle(
                      fontSize: size.width * .04,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: CustomColorsTheme.coklat,
                    ),
                  ),
                ),
                Divider(
                  color: CustomColorsTheme.coklat,
                  thickness: size.width * .005,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Info Aplikasi',
                    style: TextStyle(
                      fontSize: size.width * .04,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: CustomColorsTheme.coklat,
                    ),
                  ),
                ),
                Divider(
                  color: CustomColorsTheme.coklat,
                  thickness: size.width * .005,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Logout Akun / Ganti Akun',
                    style: TextStyle(
                      fontSize: size.width * .04,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: CustomColorsTheme.coklat,
                    ),
                  ),
                ),
                Divider(
                  color: CustomColorsTheme.coklat,
                  thickness: size.width * .005,
                ),
              ],
            ),
          ),
          DashboardTopNavigatePage(),
        ],
      ),
    );
  }
}
