import 'package:apk_kasir_by_dante/databases/db_helper.dart';
import 'package:apk_kasir_by_dante/models/tranksaksi_model.dart';

class TranksaksiDaoController {
  final DBHelper dbHelper = DBHelper();

  Future<List<Map<String, dynamic>>> getAllTransaksi() async {
    final db = await dbHelper.database;
    return await db.query('tranksaksi', orderBy: 'tanggal DESC');
  }

  Future<List<TransaksiModel>> loadTranksaksi() async {
    final db = await dbHelper.database;

    final List<Map<String, dynamic>> maps = await db.query('tranksaksi');

    return List.generate(maps.length, (i) {
      return TransaksiModel.fromMap(maps[i]);
    });
  }

  Future<List<Map<String, dynamic>>> getTransaksiItems(
    String transaksiId,
  ) async {
    final db = await dbHelper.database;
    return await db.rawQuery(
      '''
      SELECT p.nama AS nama_produk, ti.jumlah, ti.subtotal
      FROM tranksaksi_item ti
      JOIN produk p ON p.id = ti.produk_id
      WHERE ti.tranksaksi_id = ?
    ''',
      [transaksiId],
    );
  }
}
