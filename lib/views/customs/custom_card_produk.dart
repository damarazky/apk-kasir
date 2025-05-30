import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:flutter/material.dart';

class CustomCardProduk extends StatelessWidget {
  final String namaProduk;
  final double hargaProduk;
  final double labaProduk;
  final int stockProduk;
  final Function() delete;
  final Function() edit;

  const CustomCardProduk({
    super.key,
    required this.namaProduk,
    required this.hargaProduk,
    required this.stockProduk,
    required this.delete,
    required this.edit, required this.labaProduk,
  });

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
                    namaProduk,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: CustomColorsTheme.coklat,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Rp ${hargaProduk.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}",
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
                    ' $stockProduk Stock',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: CustomColorsTheme.coklat,
                      fontWeight: FontWeight.w600,
                      fontSize: size.width * .03,
                    ),
                  ),
                  SizedBox(width: size.width * .03),
                  GestureDetector(
                    onTap: edit,
                    child: Icon(Icons.edit, color: CustomColorsTheme.coklat),
                  ),
                  SizedBox(width: size.width * .03),
                  GestureDetector(
                    onTap: delete,
                    child: Icon(Icons.delete, color: CustomColorsTheme.coklat),
                  ),
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
