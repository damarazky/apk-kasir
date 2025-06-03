import 'package:apk_kasir_by_dante/models/produk_model.dart';

class ProdukCheckoutModel {
  final String id;
  final String nama;
  final double harga;
  final int stok;
  int jumlah;

  ProdukCheckoutModel({
    required this.id,
    required this.nama,
    required this.harga,
    required this.stok,
    this.jumlah = 1,
  });

  factory ProdukCheckoutModel.fromMap(Map<String, dynamic> map) {
    return ProdukCheckoutModel(
      id: map['id'],
      nama: map['nama'],
      harga: map['harga'],
      stok: map['stok'],
    );
  }

  factory ProdukCheckoutModel.fromProduk(ProdukModel produk) {
    return ProdukCheckoutModel(
      id: produk.id,
      nama: produk.nama,
      harga: produk.harga,
      stok: produk.stok ?? 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'nama': nama, 'harga': harga, 'stok': stok};
  }
}
