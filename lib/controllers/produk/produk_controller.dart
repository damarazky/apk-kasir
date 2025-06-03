// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls

import 'package:apk_kasir_by_dante/controllers/produk/checkout_controller.dart';
import 'package:apk_kasir_by_dante/controllers/produk/produk_crud_controller.dart';
import 'package:apk_kasir_by_dante/controllers/produk/produk_dao_controller.dart';
import 'package:apk_kasir_by_dante/databases/db_helper.dart';
import 'package:apk_kasir_by_dante/models/produk_checkout_model.dart';
import 'package:apk_kasir_by_dante/models/produk_model.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:get/get.dart';

class ProdukController extends GetxController {
  final ProdukCrudController crud = ProdukCrudController();
  final CheckoutController checkoutController = CheckoutController();

  var produks = <ProdukModel>[].obs;
  final DBHelper dbHelper = DBHelper();

  var modelProduk = <ProdukCheckoutModel>[].obs;

  final nama = ''.obs;
  final harga = ''.obs;
  final laba = ''.obs;
  final stock = ''.obs;

  var selectedProduk = <String>[].obs;
  var isSelecProduk = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadProduk();
  }

  bool get isFormUpdateValid =>
      nama.isNotEmpty &&
      harga.isNotEmpty &&
      laba.isNotEmpty &&
      stock.isNotEmpty;

  Future<void> loadProduk() async {
    final result = await crud.loadProduk();
    produks.value = result;

    modelProduk.value = checkoutController.selectedProduk;
  }

  Future<void> addProduk() async {
    if (nama.value.isEmpty || harga.value.isEmpty || laba.value.isEmpty) return;

    await crud.addProduk(
      nama: nama.value,
      harga: double.tryParse(harga.value) ?? 0.0,
      laba: double.tryParse(laba.value) ?? 0.0,
      stock: int.tryParse(stock.value),
    );

    Get.snackbar(
      'Berhasil',
      'Produk Berhasil Dibuat',
      backgroundColor: CustomColorsTheme.hijauNavi,
      colorText: CustomColorsTheme.coklat,
    );

    nama.value = '';
    harga.value = '';
    laba.value = '';
    stock.value = '';
    await loadProduk();
  }

  Future<void> updateProduk(ProdukModel produk) async {
    await ProdukDaoController().updateProduk(produk);
    loadProduk();
  }

  Future<void> deleteProduk(String id) async {
    await ProdukDaoController().deleteProduk(id);
    loadProduk();
  }

  void toggleProduk(String id) {
    if (selectedProduk.contains(id)) {
      selectedProduk.remove(id);
    } else {
      selectedProduk.add(id);
    }
  }

  void clearProduk() {
    selectedProduk.clear();
  }

  void toggleProdukMode() {
    isSelecProduk.value = !isSelecProduk.value;
    if (!isSelecProduk.value) {
      clearProduk();
    }
  }

  // Total Harga

  double getTotalHarga() {
    double total = 0;
    for (var produkId in selectedProduk) {
      var produk = produks.firstWhere((p) => p.id == produkId);
      total += produk.harga;
    }
    return total;
  }

  Future<void> updateStokAfterCheckout({
    required List<ProdukCheckoutModel> produkCheckout,
  }) async {
    final db = await dbHelper.database;

    print('Produk yang akan diupdate stoknya:');
    for (var p in produkCheckout) {
      print('ID: ${p.id}, Jumlah: ${p.jumlah}');
    }

    for (var produk in produkCheckout) {
      final String id = produk.id;
      final int jumlah = produk.jumlah;

      // Cari produk di list produksi lokal
      final produkIndex = produks.indexWhere((p) => p.id == id);

      if (produkIndex == -1) {
        Get.snackbar('Error', 'Produk dengan ID $id tidak ditemukan');
        continue; // lanjut ke produk berikutnya, jangan return langsung
      }

      final produkInList = produks[produkIndex];

      if (produkInList.stok == null || produkInList.stok! < jumlah) {
        Get.snackbar(
          'Stok Tidak Cukup',
          'Stok produk ${produkInList.nama} tidak mencukupi',
        );
        continue;
      }

      final newStok = produkInList.stok! - jumlah;

      final rowsAffected = await db.update(
        'produk',
        {'stok': newStok},
        where: 'id = ?',
        whereArgs: [id],
      );

      if (rowsAffected > 0) {
        print('Stok produk ${produkInList.nama} berhasil diupdate ke $newStok');
        produks[produkIndex].stok = newStok;
      } else {
        Get.snackbar('Error', 'Gagal update stok produk ${produkInList.nama}');
      }
    }

    await loadProduk(); // Refresh produk list setelah semua update
  }
}
