import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:flutter/material.dart';

class CustomTextfieldDialog extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final Function(String) onChanged;
  const CustomTextfieldDialog({super.key, required this.controller, required this.hintText, required this.keyboardType, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: size.width * .05),
      child: TextField(
        controller: controller,
        style: TextStyle(fontFamily: 'Poppins', color: CustomColorsTheme.coklat),
        cursorColor: CustomColorsTheme.coklat,
        keyboardType: keyboardType,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: 'Poppins',
            color: CustomColorsTheme.coklat,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: size.width * .005,
              color: CustomColorsTheme.coklat,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: size.width * .005,
              color: CustomColorsTheme.coklat,
            ),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              width: size.width * .005,
              color: CustomColorsTheme.coklat,
            ),
          ),
        ),
      ),
    );
  }
}
