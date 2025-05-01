import 'package:apk_kasir_by_dante/databases/db_helper.dart';
import 'package:apk_kasir_by_dante/models/produk_model.dart';

class ProdukDaoController {
  // Melihat

  Future<void> insertProduk(ProdukModel produk) async {
    final db = await DBHelper().database;
    await db.insert('produk', produk.toMap());
  }

  //  Mengambil
  Future<List<ProdukModel>> getProduks() async {
    final db = await DBHelper().database;
    final result = await db.query('produk', orderBy: 'created_at DESC');

    
    return result.map((e) => ProdukModel.fromMap(e)).toList();
  }

  // Edit
  Future<void> updateProduk(ProdukModel produk) async {
    final db = await DBHelper().database;
    await db.update(
      'produk',
      produk.toMap(),
      where: 'id = ?',
      whereArgs: [produk.id],
    );
  }

  // Hapus
  Future<void> deleteProduk(String id) async {
    final db = await DBHelper().database;
    await db.delete('produk', where: 'id = ?', whereArgs: [id]);
  }
}
