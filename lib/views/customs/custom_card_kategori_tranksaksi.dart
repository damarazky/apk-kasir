import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:flutter/material.dart';

class CustomCardKategoriTranksaksi extends StatelessWidget {
  final String namaKategori;
  final bool isSelect;
  const CustomCardKategoriTranksaksi({
    super.key,
    required this.namaKategori,
    required this.isSelect,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: size.width * .01,
        horizontal: size.width * .035,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.width * .1),
        color: CustomColorsTheme.hijauNavi,
        border: Border.all(
          width: isSelect ? size.width * .005 : 0,
          color: isSelect ? CustomColorsTheme.coklat : Colors.transparent,
        ),
      ),
      child: Center(
        child: Text(
          namaKategori,
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
