import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:flutter/material.dart';

class CustomCardDashboard extends StatelessWidget {
  final String namaProduk;
  final double hargaProduk;
  final int stockProduk;
  const CustomCardDashboard({
    super.key,
    required this.namaProduk,
    required this.hargaProduk,
    required this.stockProduk,
  });

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
                    namaProduk,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: size.width * .04,
                      fontWeight: FontWeight.w700,
                      color: CustomColorsTheme.coklat,
                    ),
                  ),
                  Text(
                    'Rp ${hargaProduk.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: size.width * .03,
                      fontWeight: FontWeight.w600,
                      color: CustomColorsTheme.coklat,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '$stockProduk',
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
          Divider(
            color: CustomColorsTheme.coklat,
            thickness: size.width * .005,
          ),
        ],
      ),
    );
  }
}
