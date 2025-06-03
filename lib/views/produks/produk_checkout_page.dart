import 'package:apk_kasir_by_dante/controllers/produk/checkout_controller.dart';
import 'package:apk_kasir_by_dante/controllers/produk/produk_controller.dart';
import 'package:apk_kasir_by_dante/controllers/produk/tranksaksi_controller.dart';
import 'package:apk_kasir_by_dante/models/produk_checkout_model.dart';
import 'package:apk_kasir_by_dante/models/produk_model.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutPage extends StatefulWidget {
  CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final CheckoutController controller = Get.find<CheckoutController>();
  final TranksaksiController transaksiController =
      Get.find<TranksaksiController>();
  final ProdukController produkC = Get.find<ProdukController>();
  final _formKey = GlobalKey<FormState>();

  final List<String> metodeList = ['Cash', 'Transfer', 'QRIS', 'E-Wallet'];
  late List<String> milihId;

  @override
  void initState() {
    super.initState();

    milihId = (Get.arguments as List<String>?) ?? [];

    List<ProdukModel> selectProduk =
        produkC.produks.where((p) => milihId.contains(p.id)).toList();

    List<ProdukCheckoutModel> checkoutList =
        selectProduk
            .map((produk) => ProdukCheckoutModel.fromProduk(produk))
            .toList();

    controller.selectedProduk.assignAll(checkoutList);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    print('Data yg diterima : $milihId');

    return Scaffold(
      backgroundColor: CustomColorsTheme.cream,
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => Container(
          margin: EdgeInsets.only(top: size.height * .075),
          padding: EdgeInsets.symmetric(horizontal: size.width * .05),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Aplikasi\nKasir',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: size.width * 0.05,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  height: size.width * .00225,
                  color: CustomColorsTheme.coklat,
                ),
              ),
              SizedBox(height: size.width * .1),
              Text(
                'Detail Tranksaksi',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: CustomColorsTheme.coklat,
                  fontWeight: FontWeight.w700,
                  fontSize: size.width * .035,
                ),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: milihId.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final produk = controller.selectedProduk[index];
                    final id = milihId[index];

                    return Container(
                      margin: EdgeInsets.only(top: size.width * .025),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                produk.nama,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: CustomColorsTheme.coklat,
                                  fontSize: size.width * .035,
                                ),
                              ),
                              Text(
                                'Rp ${produk.harga.toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: CustomColorsTheme.coklat,
                                  fontSize: size.width * .03,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.remove,
                                  color: CustomColorsTheme.coklat,
                                ),
                                onPressed: () => controller.kurangJumlah(id),
                              ),
                              Obx(() {
                                final model = controller.selectedProduk
                                    .firstWhereOrNull((e) => e.id == id);
                                return Text(
                                  '${model?.jumlah ?? 0}',
                                  style: TextStyle(
                                    color: CustomColorsTheme.coklat,
                                    fontFamily: 'Poppins',
                                  ),
                                );
                              }),
                              IconButton(
                                icon: Icon(
                                  Icons.add,
                                  color: CustomColorsTheme.coklat,
                                ),
                                onPressed: () => controller.tambahJumlah(id),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: CustomColorsTheme.coklat,
                                ),
                                onPressed: () {
                                  setState(() {
                                    milihId.removeAt(index);
                                    controller.hapusProduk(
                                      index,
                                      onRemove: () {},
                                    );
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              Divider(
                thickness: size.width * .005,
                color: CustomColorsTheme.coklat,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Harga',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: CustomColorsTheme.coklat,
                      fontSize: size.width * .04,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Rp ${controller.totalHarga.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: CustomColorsTheme.coklat,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),

              // FORM CATATAN & METODE PEMBAYARAN
              Padding(
                padding: EdgeInsets.only(top: size.width * .05),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // CATATAN
                      TextFormField(
                        cursorColor: CustomColorsTheme.coklat,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: CustomColorsTheme.coklat,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Catatan',
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: size.width * .035,
                          ),
                          labelStyle: TextStyle(
                            fontFamily: 'Poppins',
                            color: CustomColorsTheme.coklat,
                          ),
                          fillColor: CustomColorsTheme.hijauNavi,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              size.width * .5,
                            ),
                            borderSide: BorderSide(
                              width: size.width * .005,
                              color: CustomColorsTheme.coklat,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              size.width * .5,
                            ),
                            borderSide: BorderSide(
                              width: size.width * .005,
                              color: CustomColorsTheme.coklat,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              size.width * .5,
                            ),
                            borderSide: BorderSide(
                              width: size.width * .005,
                              color: CustomColorsTheme.coklat,
                            ),
                          ),
                        ),
                        maxLines: 1,
                        onChanged: (value) {
                          transaksiController.catatan.value = value;
                        },
                      ),
                      SizedBox(height: size.width * .05),

                      // DROPDOWN METODE PEMBAYARAN
                      DropdownButtonFormField<String>(
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: CustomColorsTheme.coklat,
                        ),
                        borderRadius: BorderRadius.circular(size.width * .035),
                        dropdownColor: CustomColorsTheme.cream,

                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * .035,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: size.width * .035,
                          ),
                          labelText: 'Metode Pembayaran',
                          labelStyle: TextStyle(
                            fontFamily: 'Poppins',
                            color: CustomColorsTheme.coklat,
                          ),
                          filled: true,
                          fillColor: CustomColorsTheme.hijauNavi,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              size.width * .5,
                            ),
                            borderSide: BorderSide(
                              width: size.width * .005,
                              color: CustomColorsTheme.coklat,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              size.width * .5,
                            ),
                            borderSide: BorderSide(
                              width: size.width * .005,
                              color: CustomColorsTheme.coklat,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              size.width * .5,
                            ),
                            borderSide: BorderSide(
                              width: size.width * .005,
                              color: CustomColorsTheme.coklat,
                            ),
                          ),
                        ),
                        value:
                            transaksiController.metodePembayaran.value.isEmpty
                                ? null
                                : transaksiController.metodePembayaran.value,
                        items:
                            metodeList
                                .map(
                                  (metode) => DropdownMenuItem(
                                    value: metode,
                                    child: Text(metode),
                                  ),
                                )
                                .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            transaksiController.metodePembayaran.value = value;
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // BOTTOM TOTAL + BUTTON
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: size.width * .075),
          GestureDetector(
            onTap: () async {
              if (milihId.isEmpty) {
                Get.snackbar('Info', 'Tidak ada produk untuk di-checkout');
                return;
              }

              if (transaksiController.metodePembayaran.value.isEmpty) {
                Get.snackbar(
                  'Error',
                  'Pilih metode pembayaran dulu',
                  backgroundColor: CustomColorsTheme.hijauNavi,
                  colorText: Colors.red,
                );
                return;
              }

              print("Produk yang dikirim: ${controller.selectedProduk.length}");
              print("Total harga: ${controller.totalHarga}");
              print("Catatan: ${transaksiController.catatan.value}");
              print(
                "Metode pembayaran: ${transaksiController.metodePembayaran.value}",
              );

              await transaksiController.checkoutFromList(
                controller.selectedProduk,
              );

             

              Get.back();

              Get.snackbar(
                'Sukses',
                'Checkout berhasil!',
                backgroundColor: CustomColorsTheme.hijauNavi,
                colorText: CustomColorsTheme.coklat,
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: size.width * .04),
              decoration: BoxDecoration(
                color: CustomColorsTheme.hijauNavi,
                border: Border(
                  top: BorderSide(
                    width: size.width * .005,
                    color: CustomColorsTheme.coklat,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  'Buat Pesanan',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: CustomColorsTheme.coklat,
                    fontSize: size.width * .04,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
