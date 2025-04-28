import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:flutter/material.dart';

class CustomSearchDashboard extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  const CustomSearchDashboard({super.key, required this.hintText, required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TextField(
      cursorColor: CustomColorsTheme.coklat,
      style: TextStyle(
        fontSize: size.width * .04,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search,color: CustomColorsTheme.coklat,),
        contentPadding: EdgeInsets.symmetric(horizontal: size.width * .05),
        hintText: hintText,
        hintMaxLines: 1,
        focusColor: CustomColorsTheme.coklat,
        hintStyle: TextStyle(
          fontSize: size.width * .04,
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
        ),
        fillColor: CustomColorsTheme.hijauNavi,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(size.width * .05),
          borderSide: BorderSide(
            width: size.width * .005,
            color: CustomColorsTheme.coklat,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(size.width * .05),
          borderSide: BorderSide(
            width: size.width * .005,
            color: CustomColorsTheme.coklat,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(size.width * .05),
          borderSide: BorderSide(
            width: size.width * .005,
            color: CustomColorsTheme.coklat,
          ),
        ),
      ),
    );
  }
}
