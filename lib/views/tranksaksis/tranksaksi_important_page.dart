// ignore_for_file: avoid_print

import 'package:apk_kasir_by_dante/controllers/produk/tranksaksi_controller.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_card_kategori_tranksaksi.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_card_tranksaksi.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_search_dashboard.dart';
import 'package:apk_kasir_by_dante/views/dashboards/dashboard_bottom_navigate_page.dart';
import 'package:apk_kasir_by_dante/views/dashboards/dashboard_top_navigate_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TranksaksiImportantPage extends StatelessWidget {
  TranksaksiImportantPage({super.key});

  final TranksaksiController tranksaksiController = Get.put(
    TranksaksiController(),
  );

  final List<String> kategoriList = [
    'Baru',
    'Kemarin',
    '1 Bulan',
    '6 Bulan',
    '1 Tahun',
  ];

  @override
  Widget build(BuildContext context) {
    tranksaksiController.loadAllTransaksi();

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColorsTheme.cream,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: size.height * .15),
            padding: EdgeInsets.symmetric(horizontal: size.width * .035),
            child: Column(
              children: [
                CustomSearchDashboard(
                  hintText: 'Cari Tranksaksi',
                  keyboardType: TextInputType.none,
                ),
                SizedBox(height: size.width * .05),
                SizedBox(
                  height: size.width * .075,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: kategoriList.length,
                    itemBuilder: (context, index) {
                      final kategori = kategoriList[index];
                      return Padding(
                        padding: EdgeInsets.only(right: size.width * .015),
                        child: CustomCardKategoriTranksaksi(
                          namaKategori: kategori,
                          isSelect:
                              kategori ==
                              tranksaksiController.kategoriPilih.value,
                          fungsi: () {
                            tranksaksiController.filterTranksaksiByKategori(
                              kategori,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: size.width * .020),
                Obx(() {
                  return SizedBox(
                    height: size.height * .7,
                    child: ListView.builder(
                      itemCount: tranksaksiController.transaksiList.length,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final data = tranksaksiController.transaksiList[index];
                        final rawTanggal = DateTime.parse(data.tanggal);
                        final tanggal = DateFormat(
                          'dd-MM-yyyy',
                        ).format(rawTanggal);
                        return CustomCardTranksaksi(
                          tranksaksiId: data.id,
                          tanggal: tanggal,
                        );
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
          DashboardTopNavigatePage(),
          DashboardBottomNavigatePage(),
        ],
      ),
    );
  }
}
