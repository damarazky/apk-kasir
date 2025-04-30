import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:flutter/material.dart';

class CustomCardProduk extends StatelessWidget {
  const CustomCardProduk({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.width * .05),
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
                      color: CustomColorsTheme.coklat,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Rp 20.000',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: CustomColorsTheme.coklat,
                      fontWeight: FontWeight.w600,
                      fontSize: size.width * .03,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '10 Stock',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: CustomColorsTheme.coklat,
                      fontWeight: FontWeight.w600,
                      fontSize: size.width * .03,
                    ),
                  ),
                  SizedBox(width: size.width * .03),
                  Icon(Icons.edit, color: CustomColorsTheme.coklat),
                  SizedBox(width: size.width * .03),
                  Icon(Icons.delete, color: CustomColorsTheme.coklat),
                ],
              ),
            ],
          ),
          Divider(
            thickness: size.width * .005,
            color: CustomColorsTheme.coklat,
          ),
        ],
      ),
    );
  }
}
