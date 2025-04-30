class ProdukModel {
  final String id;
  final String nama;
  final double harga;
  final int? stok;
  final String createdAt;
  final String updatedAt;

  ProdukModel({
    required this.id,
    required this.nama,
    required this.harga,
    this.stok,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProdukModel.fromMap(Map<String, dynamic> map) {
    return ProdukModel(
      id: map['id'],
      nama: map['nama'],
      harga: map['harga'],
      stok: map['stok'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'harga': harga,
      'stok': stok,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
