import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:flutter/material.dart';

class CustomTextfieldWelcomeTheme extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  const CustomTextfieldWelcomeTheme({
    super.key,
    required this.hintText,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TextField(
      cursorColor: CustomColorsTheme.coklat,
      style: TextStyle(
        fontSize: size.width * .045,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
        color: CustomColorsTheme.coklat,
      ),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: size.width * .05),
        hintText: hintText,
        hintMaxLines: 1,
        focusColor: CustomColorsTheme.coklat,
        hintStyle: TextStyle(
          fontSize: size.width * .045,
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
          color: CustomColorsTheme.coklat,
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
