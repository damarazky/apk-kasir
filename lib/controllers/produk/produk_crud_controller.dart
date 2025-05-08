import 'package:apk_kasir_by_dante/controllers/produk/produk_dao_controller.dart';
import 'package:apk_kasir_by_dante/models/produk_model.dart';
import 'package:uuid/uuid.dart';

class ProdukCrudController {
  final ProdukDaoController _dao = ProdukDaoController();

  Future<List<ProdukModel>> loadProduk() async {
    return await _dao.getProduks();
  }

  Future<void> addProduk({
    required String nama,
    required double harga,
    required double laba,
    int? stock,
  }) async {
    final produk = ProdukModel(
      id: const Uuid().v4(),
      nama: nama,
      harga: harga,
      laba: laba,
      stok: stock,
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    );
    await _dao.insertProduk(produk);
  }
}
