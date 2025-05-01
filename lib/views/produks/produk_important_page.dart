// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:apk_kasir_by_dante/controllers/produk/produk_controller.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_card_produk.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_dialog.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_search_dashboard.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_submit_dialog.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_textfield_dialog.dart';
import 'package:apk_kasir_by_dante/views/dashboards/dashboard_bottom_navigate_page.dart';
import 'package:apk_kasir_by_dante/views/dashboards/dashboard_top_navigate_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProdukImportantPage extends StatelessWidget {
  ProdukImportantPage({super.key});

  final ProdukController controller = Get.put(ProdukController());

  final namaC = TextEditingController();
  final hargaC = TextEditingController();
  final stockC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColorsTheme.cream,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: size.height * .15),
            padding: EdgeInsets.symmetric(horizontal: size.width * .035),
            child: Column(
              children: [
                CustomSearchDashboard(
                  hintText: 'Cari Produk',
                  keyboardType: TextInputType.none,
                ),
                SizedBox(
                  height: size.height * .7,
                  child: Obx(() {
                    return ListView.builder(
                      physics: ClampingScrollPhysics(),
                      itemCount: controller.produks.length,
                      itemBuilder: (context, index) {
                        final data = controller.produks[index];
                        print('Stok Produk ke-$index: ${data.stok}');

                        return CustomCardProduk(
                          namaProduk: data.nama,
                          hargaProduk: data.harga,
                          stockProduk: data.stok ?? 0,
                          // Edit
                          edit: () {
                            namaC.text = data.nama;
                            double harga = data.harga;
                            String hargaFormatted =
                                "Rp ${harga.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}";

                            String hargaTanpaTitik =
                                hargaFormatted
                                    .replaceAll('.', '')
                                    .replaceAll('Rp ', '')
                                    .trim();

                            // Step 3: Set ke controller
                            hargaC.text = hargaTanpaTitik;

                            stockC.text = data.stok?.toString() ?? '0';

                            Get.dialog(
                              CustomDialog(
                                label: 'Edit\nProduk',
                                widget: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Edit\nProduk',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            height: size.width * .0025,
                                            color: CustomColorsTheme.coklat,
                                            fontSize: size.width * .055,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '!',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: CustomColorsTheme.coklat,
                                            fontSize: size.width * .1,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: size.width * .05),
                                    CustomTextfieldDialog(
                                      controller: namaC,
                                      hintText: 'Nama Barang',
                                      keyboardType: TextInputType.text,
                                      onChanged:
                                          (val) => controller.nama.value = val,
                                    ),
                                    CustomTextfieldDialog(
                                      controller: hargaC,
                                      hintText: 'Harga Barang',
                                      keyboardType: TextInputType.number,
                                      onChanged:
                                          (val) => controller.harga.value = val,
                                    ),
                                    CustomTextfieldDialog(
                                      controller: stockC,
                                      hintText: 'Stock Barang',
                                      keyboardType: TextInputType.number,
                                      onChanged:
                                          (val) => controller.stock.value = val,
                                    ),
                                    CustomSubmitDialog(
                                      label: 'Simpan Perubahan',
                                      fungsi: () async {
                                        final updatedProduk = data.copyWith(
                                          nama: namaC.text,
                                          harga:
                                              double.tryParse(hargaC.text) ?? 0,
                                          stok: int.tryParse(stockC.text),
                                          updatedAt:
                                              DateTime.now().toIso8601String(),
                                        );

                                        await controller.updateProduk(
                                          updatedProduk,
                                        );
                                        namaC.clear();
                                        hargaC.clear();
                                        stockC.clear();
                                        Get.close();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },

                          // Delete
                          delete: () {
                            Get.defaultDialog(
                              title: 'Hapus Produk',
                              backgroundColor: CustomColorsTheme.hijauNavi,
                              titleStyle: TextStyle(
                                fontFamily: 'Poppins',
                                color: CustomColorsTheme.coklat,
                                fontWeight: FontWeight.w700,
                              ),
                              middleTextStyle: TextStyle(
                                fontFamily: 'Poppins',
                                color: CustomColorsTheme.coklat,
                              ),
                              middleText: 'Yakin ingin menghapus produk ini?',
                              textConfirm: 'Ya',
                              buttonColor: CustomColorsTheme.cream,
                              confirmTextColor: CustomColorsTheme.coklat,
                              cancelTextColor: CustomColorsTheme.coklat,
                              textCancel: 'Tidak',
                              onConfirm: () {
                                controller.deleteProduk(data.id);
                                Get.close();
                              },
                            );
                          },
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
          DashboardTopNavigatePage(),
          DashboardBottomNavigatePage(),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: size.width * .175),
        child: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: CustomColorsTheme.hijauNavi,
          onPressed: () {
            namaC.clear();
            hargaC.clear();
            stockC.clear();
            controller.nama.value = '';
            controller.harga.value = '';
            controller.stock.value = '';

            Get.dialog(
              CustomDialog(
                label: 'Buat\nProduk',
                widget: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Buat\nProduk',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            height: size.width * .0025,
                            color: CustomColorsTheme.coklat,
                            fontSize: size.width * .055,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '!',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: CustomColorsTheme.coklat,
                            fontSize: size.width * .1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.width * .05),
                    CustomTextfieldDialog(
                      controller: namaC,
                      hintText: 'Nama Barang',
                      keyboardType: TextInputType.text,
                      onChanged: (val) => controller.nama.value = val,
                    ),
                    CustomTextfieldDialog(
                      controller: hargaC,
                      hintText: 'Harga Barang',
                      keyboardType: TextInputType.number,
                      onChanged: (val) => controller.harga.value = val,
                    ),
                    CustomTextfieldDialog(
                      controller: stockC,
                      hintText: 'Stock Barang',
                      keyboardType: TextInputType.number,
                      onChanged: (val) => controller.stock.value = val,
                    ),
                    CustomSubmitDialog(
                      label: 'Buat Produk',
                      fungsi: () async {
                        print('OTW PROSES KAK');

                        await controller.addProduk();
                        namaC.clear();
                        hargaC.clear();
                        stockC.clear();

                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
          child: Icon(Icons.add, color: CustomColorsTheme.coklat),
        ),
      ),
    );
  }
}
