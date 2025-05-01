import 'package:apk_kasir_by_dante/controllers/produk/checkout_controller.dart';
import 'package:apk_kasir_by_dante/controllers/produk/tranksaksi_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutPage extends StatelessWidget {
  final CheckoutController controller = Get.put(CheckoutController());
  final TranksaksiController transaksiController =
      Get.find<TranksaksiController>();

  final _formKey = GlobalKey<FormState>();

  final List<String> metodeList = ['Cash', 'Transfer', 'QRIS', 'E-Wallet'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checkout Produk')),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.selectedProduk.length,
                itemBuilder: (context, index) {
                  final produk = controller.selectedProduk[index];
                  return ListTile(
                    title: Text(produk.nama),
                    subtitle: Text(
                      'Harga: Rp${produk.harga} - Stok: ${produk.stok}',
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () => controller.kurangJumlah(index),
                        ),
                        Text('${produk.jumlah}'),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () => controller.tambahJumlah(index),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => controller.hapusProduk(index),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // FORM CATATAN & METODE PEMBAYARAN
            Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // CATATAN
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Catatan',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 2,
                      onChanged: (value) {
                        transaksiController.catatan.value = value;
                      },
                    ),
                    SizedBox(height: 16),

                    // DROPDOWN METODE PEMBAYARAN
                    Obx(
                      () => DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Metode Pembayaran',
                          border: OutlineInputBorder(),
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // BOTTOM TOTAL + BUTTON
      bottomNavigationBar: Obx(
        () => Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Total: Rp${controller.totalHarga.toStringAsFixed(2)}'),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  if (transaksiController.metodePembayaran.value.isEmpty) {
                    Get.snackbar('Error', 'Pilih metode pembayaran dulu');
                    return;
                  }

                  await transaksiController.checkoutFromList(
                    controller.selectedProduk,
                  );
                  Get.back();
                  Get.snackbar('Sukses', 'Checkout berhasil!');
                },
                child: Text('Proses Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
