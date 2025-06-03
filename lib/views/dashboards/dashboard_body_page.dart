// ignore_for_file: avoid_print

import 'package:apk_kasir_by_dante/controllers/produk/checkout_controller.dart';
import 'package:apk_kasir_by_dante/controllers/produk/produk_controller.dart';
import 'package:apk_kasir_by_dante/controllers/produk/tranksaksi_controller.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_card_dashboard.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_search_dashboard.dart';
import 'package:apk_kasir_by_dante/views/produks/produk_checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardBodyPage extends StatelessWidget {
  DashboardBodyPage({super.key}) {
    Get.put(CheckoutController());
  }

  final ProdukController controller = Get.put(ProdukController());
  final TranksaksiController tranksaksiController = Get.put(
    TranksaksiController(),
  );
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Obx(
      () => Container(
        margin: EdgeInsets.only(top: size.height * .15),
        padding: EdgeInsets.symmetric(horizontal: size.width * .035),
        width: size.width,
        height: double.infinity,
        child: Stack(
          children: [
            CustomSearchDashboard(
              hintText: 'Cari Barang',
              keyboardType: TextInputType.text,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: size.width * .15,
                bottom: size.width * .2,
              ),
              child: ListView.builder(
                itemCount: controller.produks.length,
                padding: EdgeInsets.zero,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  final produk = controller.produks[index];
                  return GestureDetector(
                    onTap: () {
                      if (controller.isSelecProduk.value) {
                        controller.toggleProduk(produk.id);
                      }
                    },
                    child: Obx(
                      () => CustomCardDashboard(
                        namaProduk: produk.nama,
                        hargaProduk: produk.harga,
                        stockProduk: produk.stok ?? 0,
                        selecProduk: controller.selectedProduk.contains(
                          produk.id,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 0,
              right: size.width * .05,
              child: Padding(
                padding: EdgeInsets.only(bottom: size.width * .2),
                child: FloatingActionButton(
                  shape: CircleBorder(),
                  backgroundColor: CustomColorsTheme.hijauNavi,
                  onPressed: () async {
                    if (!controller.isSelecProduk.value) {
                      controller.toggleProdukMode();
                      return;
                    }

                    print(
                      'Data yang di kirim : ${controller.selectedProduk.value}',
                    );

                    if (controller.selectedProduk.isNotEmpty &&
                        controller.isSelecProduk.value) {
                      final List<String> selectP =
                          controller.produks
                              .where(
                                (p) => controller.selectedProduk.contains(p.id),
                              )
                              .map((p) => p.id)
                              .toList();

                      print('select P $selectP');

                      await Get.to(
                        () => CheckoutPage(),
                        transition: Transition.fadeIn,
                        preventDuplicates: false,
                        duration: const Duration(milliseconds: 500),
                        arguments: selectP,
                      )!.then((_) {
                        controller.clearProduk();
                        controller.isSelecProduk.value = false;
                      });
                    } else {
                      controller.clearProduk();
                      controller.isSelecProduk.value = false;
                    }
                  },
                  child: Icon(
                    controller.isSelecProduk.value
                        ? (controller.selectedProduk.isNotEmpty
                            ? Icons.check
                            : Icons.close)
                        : Icons.attach_money_rounded,
                    color: CustomColorsTheme.coklat,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
