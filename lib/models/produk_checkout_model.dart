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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'harga': harga,
      'stok': stok,
    };
  }
}
