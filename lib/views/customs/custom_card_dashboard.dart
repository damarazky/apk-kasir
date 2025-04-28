import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:flutter/material.dart';

class CustomCardDashboard extends StatelessWidget {
  const CustomCardDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.width * .03),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nasi Goreng',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: size.width * .04,
                      fontWeight: FontWeight.bold,
                      color: CustomColorsTheme.coklat,
                    ),
                  ),
                  Text(
                    'Rp 20.000',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: size.width * .03,
                      fontWeight: FontWeight.bold,
                      color: CustomColorsTheme.coklat,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '10',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: size.width * .03,
                      fontWeight: FontWeight.bold,
                      color: CustomColorsTheme.coklat,
                    ),
                  ),
                  Text(
                    'Stock',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: size.width * .03,
                      fontWeight: FontWeight.bold,
                      color: CustomColorsTheme.coklat,
                    ),
                  ),
                ],
              ),
            ],
          ),
         Divider(color: CustomColorsTheme.coklat,thickness: size.width * .005,)
        ],
      ),
    );
  }
}
