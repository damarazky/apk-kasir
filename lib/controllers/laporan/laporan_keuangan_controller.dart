import 'package:apk_kasir_by_dante/databases/db_helper.dart';
import 'package:apk_kasir_by_dante/models/laporan_chart_data_model.dart';
import 'package:apk_kasir_by_dante/models/laporan_keuangan_model.dart';
import 'package:get/get.dart';

class LaporanController extends GetxController {
  final laporanList = <LaporanItem>[].obs;
  final totalPendapatan = 0.0.obs;
  final chartData = <ProdukChartData>[].obs;

  Future<void> fetchLaporan() async {
    final db = await DBHelper().database;

    final List<Map<String, dynamic>> data = await db.rawQuery('''
    SELECT 
      p.nama AS namaProduk,
      SUM(ti.jumlah) AS totalJumlah,
      SUM(ti.jumlah * p.harga) AS totalSubtotal,
      SUM(p.laba * ti.jumlah) AS totalLaba
      FROM tranksaksi_item ti
      JOIN produk p ON p.id = ti.produk_id
      GROUP BY p.nama
      ORDER BY totalSubtotal DESC
  ''');

    // Mapping ke laporanList
    laporanList.value =
        data.map((e) {
          return LaporanItem(
            namaProduk: e['namaProduk'] ?? 'Tidak diketahui',
            jumlah: e['totalJumlah'] ?? 0,
            subtotal: (e['totalSubtotal'] ?? 0).toDouble(),
            laba: (e['totalLaba'] ?? 0).toDouble(),
            tanggal: '',
          );
        }).toList();

    // Hitung total pendapatan
    totalPendapatan.value = laporanList.fold(
      0.0,
      (sum, item) => sum + item.subtotal,
    );

    // Mapping ke chartData
    chartData.value =
        data.map((e) {
          return ProdukChartData(
            nama: e['namaProduk'] ?? 'Tidak diketahui',
            pendapatan: (e['totalSubtotal'] ?? 0).toDouble(),
          );
        }).toList();
  }
}
