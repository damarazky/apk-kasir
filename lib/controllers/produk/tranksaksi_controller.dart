// ignore_for_file: avoid_print

import 'package:apk_kasir_by_dante/controllers/produk/checkout_controller.dart';
import 'package:apk_kasir_by_dante/controllers/produk/produk_controller.dart';
import 'package:apk_kasir_by_dante/controllers/produk/tranksaksi_dao_controller.dart';
import 'package:apk_kasir_by_dante/databases/db_helper.dart';
import 'package:apk_kasir_by_dante/models/produk_checkout_model.dart';
import 'package:apk_kasir_by_dante/models/tranksaksi_item_model.dart';
import 'package:apk_kasir_by_dante/models/tranksaksi_model.dart';
import 'package:apk_kasir_by_dante/views/tranksaksis/produk_tranksaksi_detail.page.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class TranksaksiController extends GetxController {
  final DBHelper dbHelper = DBHelper();

  late ProdukController produkController;
  late CheckoutController checkoutController;
  final TranksaksiDaoController tranksaksi = TranksaksiDaoController();

  @override
  void onInit() {
    checkoutController = Get.put(CheckoutController());
    produkController = Get.find<ProdukController>();
    super.onInit();
  }

  var metodePembayaran = ''.obs;
  var catatan = ''.obs;

  var transaksiList = <TransaksiModel>[].obs;
  var semuaTransaksi = <TransaksiModel>[];
  var transaksiItems = <TransaksiItemModel>[].obs;
  var kategoriPilih = 'Baru'.obs;

  Future<void> loadAllTransaksi() async {
    final result = await tranksaksi.getAllTransaksi();
    transaksiList.value = result.map((e) => TransaksiModel.fromMap(e)).toList();
    semuaTransaksi = await tranksaksi.loadTranksaksi();
    filterTranksaksiByKategori(kategoriPilih.value);
  }

  void clearTranksaksi() {
    transaksiItems.clear();
  }

  void filterTranksaksiByKategori(String kategori) {
    final now = DateTime.now();
    late DateTime fromDate;

    switch (kategori) {
      case 'Baru':
        fromDate = DateTime(now.year, now.month, now.day);
        break;
      case 'Kemarin':
        fromDate = DateTime(now.year, now.month, now.day - 1);
        break;
      case '1 Bulan':
        fromDate = DateTime(now.year, now.month - 1, now.day);
        break;
      case '6 Bulan':
        fromDate = DateTime(now.year, now.month - 6, now.day);
        break;
      case '1 Tahun':
        fromDate = DateTime(now.year - 1, now.month, now.day);
        break;
      default:
        fromDate = now;
    }

    transaksiList.value =
        semuaTransaksi.where((trx) {
          final trxDate = DateTime.parse(trx.tanggal);
          if (kategori == 'Kemarin') {
            return trxDate.year == fromDate.year &&
                trxDate.month == fromDate.month &&
                trxDate.day == fromDate.day;
          }
          return trxDate.isAfter(fromDate) ||
              trxDate.isAtSameMomentAs(fromDate);
        }).toList();
    kategoriPilih.value = kategori;
  }

  Future<void> loadDetailTransaksi(String transaksiId) async {
    final result = await tranksaksi.getTransaksiItems(transaksiId);
    transaksiItems.value =
        result.map((e) => TransaksiItemModel.fromMap(e)).toList();
  }

  Future<void> checkoutFromList(List<ProdukCheckoutModel> list) async {
    double totalHarga = list.fold(
      0,
      (sum, item) => sum + item.harga * item.jumlah,
    );

    var db = await dbHelper.database;
    final tranksaksiId = const Uuid().v1();

    try {
      await db.transaction((txn) async {
        await txn.insert('tranksaksi', {
          'id': tranksaksiId,
          'tanggal': DateTime.now().toString(),
          'total_harga': totalHarga,
          'metode_pembayaran': metodePembayaran.value,
          'catatan': catatan.value,
        });

        for (var item in list) {
          await txn.insert('tranksaksi_item', {
            'id': const Uuid().v1() + item.id,
            'tranksaksi_id': tranksaksiId,
            'produk_id': item.id,
            'jumlah': item.jumlah,
            'subtotal': item.harga * item.jumlah,
            'harga_produk': item.harga,
          });
        }
      });

      print('proses perubahan stock mulai');

      await produkController.loadProduk();
      await produkController.updateStokAfterCheckout(
        produkCheckout: checkoutController.selectedProduk,
      );
      print('proses perubahan stock selesai');

      Get.to(
        () => DetailTransaksiPage(transaksiId: [tranksaksiId]),
        transition: Transition.fadeIn,
        preventDuplicates: false,
        duration: const Duration(milliseconds: 200),
      );
      metodePembayaran.value = '';
      catatan.value = '';

      produkController.update();
    } catch (e) {
      print("Error: $e");
    }
  }
}
