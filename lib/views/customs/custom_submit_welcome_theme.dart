import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:flutter/material.dart';

class CustomSubmitWelcomeTheme extends StatelessWidget {
  final String teks;
  final Function() fungsi;
  const CustomSubmitWelcomeTheme({super.key, required this.teks, required this.fungsi});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.width * .1),
      padding: EdgeInsets.symmetric(horizontal: size.width * .075),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: CustomColorsTheme.hijauNavi,
          border: Border.all(
            width: size.width * .005,
            color: CustomColorsTheme.coklat,
          ),
          borderRadius: BorderRadius.circular(size.width * .05),
        ),
        child: GestureDetector(
          onTap: fungsi,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: size.width * .03),
            child: Center(
              child: Text(
                teks,
                style: TextStyle(
                  fontSize: size.width * .05,
                  color: CustomColorsTheme.coklat,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
