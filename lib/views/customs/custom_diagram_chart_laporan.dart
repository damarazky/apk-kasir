import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomDiagramChartLaporan extends StatefulWidget {
  const CustomDiagramChartLaporan({super.key});

  @override
  State<CustomDiagramChartLaporan> createState() =>
      _CustomDiagramChartLaporanState();
}

class _CustomDiagramChartLaporanState extends State<CustomDiagramChartLaporan> {
  final List<_ProdukData> chartData = [
    _ProdukData('Nasi Goreng', 20000, 200),
    _ProdukData('Es Teh', 3000, 10),
    _ProdukData('Mie Ayam', 100000, 10),
    _ProdukData('Es Jeruk', 10000, 20),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
            series: <CartesianSeries<_ProdukData, String>>[
              LineSeries<_ProdukData, String>(
                dataSource: chartData,
                xValueMapper: (_ProdukData sales, _) => sales.nama,
                yValueMapper: (_ProdukData sales, _) => sales.pendapatan,
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
              flex: 2,
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
          ],
        ),

        SizedBox(height: 8),

        /// DATA ROWS
        Column(
          children:
              chartData.map((produk) {
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
                          produk.nama,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: CustomColorsTheme.coklat,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          '${produk.stock}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: CustomColorsTheme.coklat,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Rp ${produk.pendapatan.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: CustomColorsTheme.coklat,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}

class _ProdukData {
  _ProdukData(this.nama, this.pendapatan, this.stock);

  final String nama;
  final int pendapatan;
  final int stock;
}
