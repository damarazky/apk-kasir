class TransaksiModel {
  final String id;
  final String tanggal;
  final double totalHarga;
  final String metodePembayaran;
  final String catatan;

  TransaksiModel({
    required this.id,
    required this.tanggal,
    required this.totalHarga,
    required this.metodePembayaran,
    required this.catatan,
  });

  factory TransaksiModel.fromMap(Map<String, dynamic> map) {
    return TransaksiModel(
      id: map['id'],
      tanggal: map['tanggal'],
      totalHarga: map['total_harga'],
      metodePembayaran: map['metode_pembayaran'],
      catatan: map['catatan'],
    );
  }
}

