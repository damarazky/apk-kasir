import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String label;
  final Widget widget;
  const CustomDialog({super.key, required this.label, required this.widget});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: CustomColorsTheme.hijauNavi,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(size.width * .025),
      ),
      insetPadding: EdgeInsets.symmetric(
        horizontal: size.width * .05,
        vertical: size.width * .025,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * .05,
          vertical: size.width * .025,
        ),
        child: widget,
      ),
    );
  }
}
