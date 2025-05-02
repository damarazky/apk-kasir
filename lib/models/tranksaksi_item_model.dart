class TransaksiItemModel {
  final String namaProduk;
  final int jumlah;
  final double subtotal;

  TransaksiItemModel({
    required this.namaProduk,
    required this.jumlah,
    required this.subtotal,
  });

  factory TransaksiItemModel.fromMap(Map<String, dynamic> map) {
    return TransaksiItemModel(
      namaProduk: map['nama_produk'],
      jumlah: map['jumlah'],
      subtotal: map['subtotal'],
    );
  }
}
