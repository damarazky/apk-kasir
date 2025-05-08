class TransaksiItemModel {
  final String namaProduk;
  final int jumlah;
  final double subtotal;
  final double hargaProduk;

  TransaksiItemModel({
    required this.namaProduk,
    required this.jumlah,
    required this.subtotal,
    required this.hargaProduk,
  });

  factory TransaksiItemModel.fromMap(Map<String, dynamic> map) {
    return TransaksiItemModel(
      namaProduk: map['nama_produk'],
      jumlah: map['jumlah'],
      subtotal: map['subtotal'],
      hargaProduk: map['harga_produk'],
    );
  }
}
