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
}
