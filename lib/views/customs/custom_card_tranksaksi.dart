import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:flutter/material.dart';

class CustomCardTranksaksi extends StatelessWidget {
  const CustomCardTranksaksi({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'NS990190910190',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                color: CustomColorsTheme.coklat,
              ),
            ),
            Text(
              '11:00 WIB',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                color: CustomColorsTheme.coklat,
              ),
            ),
          ],
        ),
        Divider(color: CustomColorsTheme.coklat, thickness: size.width * .005),
      ],
    );
  }
}
