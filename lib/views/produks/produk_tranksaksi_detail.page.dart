import 'package:apk_kasir_by_dante/databases/db_helper.dart';
import 'package:flutter/material.dart';

class DetailTransaksiPage extends StatefulWidget {
  final String transaksiId;

  const DetailTransaksiPage({Key? key, required this.transaksiId})
    : super(key: key);

  @override
  State<DetailTransaksiPage> createState() => _DetailTransaksiPageState();
}

class _DetailTransaksiPageState extends State<DetailTransaksiPage> {
  Map<String, dynamic>? transaksi;
  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Transaksi')),
      body:
          transaksi == null
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tanggal: ${transaksi!['tanggal']}"),
                    const SizedBox(height: 4),
                    Text(
                      "Metode Pembayaran: ${transaksi!['metode_pembayaran']}",
                    ),
                    const SizedBox(height: 4),
                    Text("Catatan: ${transaksi!['catatan']}"),
                    const Divider(height: 24),
                    const Text(
                      "Daftar Produk:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: ListView.separated(
                        itemCount: items.length,
                        separatorBuilder: (_, __) => const Divider(),
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return ListTile(
                            title: Text(item['nama']),
                            subtitle: Text(
                              "${item['jumlah']} x ${item['harga']} = Rp ${item['subtotal']}",
                            ),
                          );
                        },
                      ),
                    ),
                    const Divider(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Total: Rp ${transaksi!['total_harga']}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
    );
  }

  Future<void> _loadData() async {
    final DBHelper dbHelper = DBHelper();
    final db = await dbHelper.database;

    final transaksiData = await db.query(
      'tranksaksi',
      where: 'id = ?',
      whereArgs: [widget.transaksiId],
    );

    final itemData = await db.rawQuery(
      '''
      SELECT ti.*, p.nama, p.harga 
      FROM tranksaksi_item ti
      JOIN produk p ON ti.produk_id = p.id
      WHERE ti.tranksaksi_id = ?
    ''',
      [widget.transaksiId],
    );

    setState(() {
      transaksi = transaksiData.isNotEmpty ? transaksiData.first : null;
      items = itemData;
    });
  }
}
