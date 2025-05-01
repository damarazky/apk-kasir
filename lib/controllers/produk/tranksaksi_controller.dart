// ignore_for_file: avoid_print

import 'package:apk_kasir_by_dante/controllers/produk/produk_controller.dart';
import 'package:apk_kasir_by_dante/databases/db_helper.dart';
import 'package:apk_kasir_by_dante/models/produk_checkout_model.dart';
import 'package:apk_kasir_by_dante/views/produks/produk_tranksaksi_detail.page.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class TranksaksiController extends GetxController {
  final DBHelper dbHelper = DBHelper();

  final ProdukController produkController = Get.find<ProdukController>();

  var metodePembayaran = ''.obs;
  var catatan = ''.obs;

  Future<void> checkoutFromList(List<ProdukCheckoutModel> list) async {
    double totalHarga = list.fold(
      0,
      (sum, item) => sum + item.harga * item.jumlah,
    );

    var db = await dbHelper.database;
    final tranksaksiId = const Uuid().v1();

    try {
      await db.insert('tranksaksi', {
        'id': tranksaksiId,
        'tanggal': DateTime.now().toString(),
        'total_harga': totalHarga,
        'metode_pembayaran': metodePembayaran.value,
        'catatan': catatan.value,
      });

      for (var item in list) {
        await db.insert('tranksaksi_item', {
          'id': const Uuid().v1() + item.id,
          'tranksaksi_id': tranksaksiId,
          'produk_id': item.id,
          'jumlah': item.jumlah,
          'subtotal': item.harga * item.jumlah,
        });
      }

      await produkController.updateStokAfterChekout();

      Get.to(
        () => DetailTransaksiPage(transaksiId: tranksaksiId),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 200),
      );
    } catch (e) {
      print("Error: $e");
    }
  }
}
