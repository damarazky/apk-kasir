import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:apk_kasir_by_dante/views/produks/produk_tranksaksi_detail.page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardTranksaksi extends StatelessWidget {
  final String tranksaksiId;
  final String tanggal;
  const CustomCardTranksaksi({
    super.key,
    required this.tranksaksiId,
    required this.tanggal,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Get.to(
          () => DetailTransaksiPage(transaksiId: tranksaksiId),
          transition: Transition.fadeIn,
          duration: const Duration(milliseconds: 200),
        );
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  tranksaksiId,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    color: CustomColorsTheme.coklat,
                  ),
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                ' $tanggal',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  color: CustomColorsTheme.coklat,
                ),
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
