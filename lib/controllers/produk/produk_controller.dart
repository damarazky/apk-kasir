// ignore_for_file: avoid_print

import 'package:apk_kasir_by_dante/controllers/produk/produk_crud_controller.dart';
import 'package:apk_kasir_by_dante/controllers/produk/produk_dao_controller.dart';
import 'package:apk_kasir_by_dante/databases/db_helper.dart';
import 'package:apk_kasir_by_dante/models/produk_model.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:get/get.dart';

class ProdukController extends GetxController {
  final ProdukCrudController crud = ProdukCrudController();
  var produks = <ProdukModel>[].obs;
  final DBHelper dbHelper = DBHelper();

  final nama = ''.obs;
  final harga = ''.obs;
  final stock = ''.obs;

  var selectedProduk = <String>[].obs;
  var isSelecProduk = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadProduk();
    ever(selectedProduk, (_) {
      print("Selected Produk: $selectedProduk");
    });
  }

  Future<void> loadProduk() async {
    final result = await crud.loadProduk();
    produks.value = result;
  }

  Future<void> addProduk() async {
    if (nama.value.isEmpty || harga.value.isEmpty) return;

    await crud.addProduk(
      nama: nama.value,
      harga: double.tryParse(harga.value) ?? 0.0,
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
}
