import 'package:apk_kasir_by_dante/databases/db_helper.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_routes_page.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailTransaksiPage extends StatefulWidget {
  final List<String> transaksiId;

  const DetailTransaksiPage({super.key, required this.transaksiId});

  @override
  State<DetailTransaksiPage> createState() => _DetailTransaksiPageState();
}

class _DetailTransaksiPageState extends State<DetailTransaksiPage> {
  List<Map<String, dynamic>> items = [];
  List<Map<String, dynamic>> transaksiList = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColorsTheme.cream,
      body:
          items.isEmpty
              ? Center(
                child: Text(
                  'Data Kosong',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: CustomColorsTheme.coklat,
                  ),
                ),
              )
              : ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: transaksiList.length,
                itemBuilder: (context, index) {
                  final transaksi = transaksiList[index];
                  final relatedItem =
                      items
                          .where(
                            (item) => item['tranksaksi_id'] == transaksi['id'],
                          )
                          .toList();

                  return Container(
                    margin: EdgeInsets.only(top: size.height * .075),
                    padding: EdgeInsets.symmetric(horizontal: size.width * .05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Aplikasi\nKasir',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: size.width * 0.05,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            height: size.width * .00225,
                            color: CustomColorsTheme.coklat,
                          ),
                        ),
                        SizedBox(height: size.width * .1),
                        Text(
                          'Pembayaran Berhasil',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: CustomColorsTheme.coklat,
                            fontWeight: FontWeight.w700,
                            fontSize: size.width * .035,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: size.width * .02,
                          ),
                          child: BarcodeWidget(
                            height: size.width * .2,
                            data: ' ${transaksi['id']}',
                            barcode: Barcode.code128(),
                            drawText: false,
                          ),
                        ),
                        Text(
                          "${transaksi['tanggal']} NO INVOICE ${transaksi['id']}",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: CustomColorsTheme.coklat,
                            fontWeight: FontWeight.w700,
                            fontSize: size.width * .025,
                          ),
                        ),
                        SizedBox(height: size.width * .015),
                        Text(
                          "Metode Pembayaran: ${transaksi['metode_pembayaran']}",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: CustomColorsTheme.coklat,
                          ),
                        ),

                        Text(
                          "Catatan: ${transaksi['catatan']}",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: CustomColorsTheme.coklat,
                          ),
                        ),
                        SizedBox(height: size.width * .015),
                        Divider(
                          height: size.width * .02,
                          color: CustomColorsTheme.coklat,
                        ),
                        SizedBox(height: size.width * .025),
                        const Text(
                          "Daftar Produk :",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: CustomColorsTheme.coklat,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: size.width * .025),
                        ...relatedItem.map(
                          (p) => Padding(
                            padding: EdgeInsets.symmetric(vertical: size.width * .010),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  ' ${p['nama']} ( ${p['jumlah']} )',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: CustomColorsTheme.coklat,
                                  ),
                                ),
                                Text(
                                  ' Rp ${p['harga_produk']}',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: CustomColorsTheme.coklat,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          thickness: size.width * .002,
                          color: CustomColorsTheme.coklat,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Harga',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: CustomColorsTheme.coklat,
                                fontSize: size.width * .04,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Rp ${transaksi['total_harga']}',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: CustomColorsTheme.coklat,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.width * .035),
                      ],
                    ),
                  );
                },
              ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: size.width * .04),
            margin: EdgeInsets.only(bottom: size.width * .035),
            decoration: BoxDecoration(
              color: CustomColorsTheme.hijauNavi,
              border: Border.symmetric(
                horizontal: BorderSide(
                  width: size.width * .005,
                  color: CustomColorsTheme.coklat,
                ),
              ),
            ),
            child: Center(
              child: Text(
                'Cetak Transaksi',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: CustomColorsTheme.coklat,
                  fontSize: size.width * .04,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: size.width * .04),
            decoration: BoxDecoration(
              color: CustomColorsTheme.hijauNavi,
              border: Border(
                top: BorderSide(
                  width: size.width * .005,
                  color: CustomColorsTheme.coklat,
                ),
              ),
            ),
            child: GestureDetector(
              onTap: () {
                Get.offAllNamed(CustomRoutesPage.dashboardImportant);
              },
              child: Center(
                child: Text(
                  'Kembali Ke Dashboard',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: CustomColorsTheme.coklat,
                    fontSize: size.width * .04,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _loadData() async {
    final DBHelper dbHelper = DBHelper();
    final db = await dbHelper.database;

    try {
      List<Map<String, dynamic>> allTransaksi = [];
      List<Map<String, dynamic>> allItems = [];

      for (String id in widget.transaksiId) {
        final transaksiData = await db.query(
          'tranksaksi',
          where: 'id = ?',
          whereArgs: [id],
        );

        final itemData = await db.rawQuery(
          '''
        SELECT ti.*, p.nama, p.harga 
        FROM tranksaksi_item ti
        JOIN produk p ON ti.produk_id = p.id
        WHERE ti.tranksaksi_id = ?
        ''',
          [id],
        );

        if (transaksiData.isNotEmpty) {
          allTransaksi.add(transaksiData.first);
          allItems.addAll(itemData);
        }
      }

      setState(() {
        transaksiList = allTransaksi;
        items = allItems;
      });
    } catch (e) {
      debugPrint('Error loading data: $e');
    }
  }
}
