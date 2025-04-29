import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:flutter/material.dart';

class CustomCardKategoriTranksaksi extends StatelessWidget {
  const CustomCardKategoriTranksaksi({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: size.width * .015,
        horizontal: size.width * .035,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.width * .1),
        color: CustomColorsTheme.hijauNavi,
      ),
      child: Center(
        child: Text(
          'Baru Ini',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: CustomColorsTheme.coklat,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
