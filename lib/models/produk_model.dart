class ProdukModel {
  final String id;
  final String nama;
  final double harga;
  final double laba;
  int? stok;
  final String createdAt;
  final String updatedAt;

  ProdukModel({
    required this.id,
    required this.nama,
    required this.harga,
    required this.laba,
    this.stok,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProdukModel.fromMap(Map<String, dynamic> map) {
    return ProdukModel(
      id: map['id'],
      nama: map['nama'],
      harga: map['harga'] != null ? (map['harga'] as num).toDouble() : 0.0,
      laba: map['laba'] != null ? (map['laba'] as num).toDouble() : 0.0,
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
      'laba': laba,
      'stok': stok,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  ProdukModel copyWith({
    String? id,
    String? nama,
    double? harga,
    double? laba,
    int? stok,
    String? createdAt,
    String? updatedAt,
  }) {
    return ProdukModel(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      harga: harga ?? this.harga,
      laba: laba ?? this.laba,
      stok: stok ?? this.stok,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
