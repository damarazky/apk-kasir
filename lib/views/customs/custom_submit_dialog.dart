import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:flutter/material.dart';

class CustomSubmitDialog extends StatelessWidget {
  final String label;
  final Function() fungsi;
  const CustomSubmitDialog({
    super.key,
    required this.label,
    required this.fungsi,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: EdgeInsets.symmetric(vertical: size.width * .015),
      padding: EdgeInsets.symmetric(vertical: size.width * .025),
      decoration: BoxDecoration(
        color: CustomColorsTheme.cream,
        borderRadius: BorderRadius.circular(size.width * .025),
      ),
      child: GestureDetector(
        onTap: fungsi,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: size.width * .04,
              color: CustomColorsTheme.coklat,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
