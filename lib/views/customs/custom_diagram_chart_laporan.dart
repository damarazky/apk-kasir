import 'package:apk_kasir_by_dante/controllers/laporan/laporan_keuangan_controller.dart';
import 'package:apk_kasir_by_dante/models/laporan_chart_data_model.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomDiagramChartLaporan extends StatelessWidget {
  CustomDiagramChartLaporan({super.key});

  final LaporanController laporanController = Get.put(LaporanController());

  @override
  Widget build(BuildContext context) {
    laporanController.fetchLaporan();
    final size = MediaQuery.of(context).size;
    return Obx(() {
      final charData = laporanController.chartData;
      return Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: size.width * .035),
            height: size.width / 2,
            child: SfCartesianChart(
              backgroundColor: CustomColorsTheme.cream,
              borderColor: CustomColorsTheme.coklat,
              primaryXAxis: CategoryAxis(),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <CartesianSeries<ProdukChartData, String>>[
                LineSeries<ProdukChartData, String>(
                  dataSource: charData,
                  xValueMapper: (ProdukChartData sales, _) => sales.nama,
                  yValueMapper: (ProdukChartData sales, _) => sales.pendapatan,
                  // Enable data label
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                ),
              ],
            ),
          ),

          /// HEADER
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  'Nama Produk',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    color: CustomColorsTheme.coklat,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  'Stock',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    color: CustomColorsTheme.coklat,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  'Pendapatan',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    color: CustomColorsTheme.coklat,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'Laba',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    color: CustomColorsTheme.coklat,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 8),

          /// DATA ROWS
          SizedBox(
            height: size.height * .3,
            child: ListView.builder(
              itemCount: laporanController.laporanList.length,
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final produk = laporanController.laporanList[index];
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade300,
                        width: 0.8,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          produk.namaProduk,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: CustomColorsTheme.coklat,
                            fontSize: size.width * .03,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          '${produk.jumlah}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: CustomColorsTheme.coklat,
                            fontSize: size.width * .03,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          "Rp ${produk.subtotal.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: CustomColorsTheme.coklat,
                            fontSize: size.width * .03,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Rp ${produk.laba.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: CustomColorsTheme.coklat,
                            fontSize: size.width * .03,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
