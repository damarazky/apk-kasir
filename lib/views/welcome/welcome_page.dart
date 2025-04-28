import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Positioned(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Aplikasi Desa',
              style: TextStyle(
                fontSize: size.width * 0.35,
                fontFamily: 'Poppins',
                color: CustomColorsTheme.coklat,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
