import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:apk_kasir_by_dante/views/dashboards/dashboard_top_navigate_page.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class TranksaksiDetailPage extends StatelessWidget {
  const TranksaksiDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColorsTheme.cream,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: size.height * .2),
            padding: EdgeInsets.symmetric(horizontal: size.width * .05),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pembayaran Berhasil',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: size.width * .04,
                      color: CustomColorsTheme.coklat,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: size.width * .02),
                  BarcodeWidget(
                    data: 'test saja ini',
                    barcode: Barcode.code128(),
                    width: size.width,
                    height: size.width * .15,
                    drawText: false,
                  ),
                  SizedBox(height: size.width * .02),
                  Text(
                    '26/07/2025 11:25 NO INVOICE NS990190910190',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: size.width * .03,
                      color: CustomColorsTheme.coklat,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: size.width * .05),
                  Text(
                    'Total',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: size.width * .045,
                      color: CustomColorsTheme.coklat,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: size.width * .025),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nasi Goreng (2)',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: size.width * .03,
                          color: CustomColorsTheme.coklat,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Rp 20.000',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: size.width * .03,
                          color: CustomColorsTheme.coklat,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * .05),
                margin: EdgeInsets.only(bottom: size.width * .05),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Harga',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: size.width * .03,
                            color: CustomColorsTheme.coklat,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Rp 40.000',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: size.width * .03,
                            color: CustomColorsTheme.coklat,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: CustomColorsTheme.coklat,
                      thickness: size.width * .005,
                    ),
                  ],
                ),
              ),

              Container(
                width: size.width,
                height: size.width * .15,
                color: CustomColorsTheme.hijauNavi,
                padding: EdgeInsets.symmetric(vertical: size.width * .05),
                child: Center(
                  child: Text(
                    'Cetak Tranksaksi',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: size.width * .04,
                      fontWeight: FontWeight.w700,
                      color: CustomColorsTheme.coklat,
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.width * .035),
              Container(
                width: size.width,
                height: size.width * .15,
                color: CustomColorsTheme.hijauNavi,
                padding: EdgeInsets.symmetric(vertical: size.width * .05),
                child: Center(
                  child: Text(
                    'Kembali Ke Dashboard',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: size.width * .04,
                      fontWeight: FontWeight.w700,
                      color: CustomColorsTheme.coklat,
                    ),
                  ),
                ),
              ),
            ],
          ),
          DashboardTopNavigatePage(),
        ],
      ),
    );
  }
}
