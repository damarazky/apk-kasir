import 'package:apk_kasir_by_dante/controllers/produk/produk_controller.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_card_dashboard.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_search_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardBodyPage extends StatelessWidget {
  DashboardBodyPage({super.key});

  final ProdukController controller = Get.put(ProdukController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
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
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.produks.length,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  final produk = controller.produks[index];
                  return CustomCardDashboard(
                    namaProduk: produk.nama,
                    hargaProduk: produk.harga,
                    stockProduk: produk.stok ?? 0,
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
