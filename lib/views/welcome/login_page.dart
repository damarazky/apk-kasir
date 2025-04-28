import 'package:apk_kasir_by_dante/views/customs/custom_colors_theme.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_submit_welcome_theme.dart';
import 'package:apk_kasir_by_dante/views/customs/custom_textfield_welcome_theme.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomColorsTheme.cream,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * .1,
              vertical: size.width * .3,
            ),
            child: Center(
              child: Hero(
                tag: 'welcome-teks',
                child: Text(
                  'Aplikasi Kasir',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: size.width * 0.125,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    height: size.width * .00225,
                    color: CustomColorsTheme.coklat,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .075),
            child: CustomTextfieldWelcomeTheme(
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.width * .05),
            padding: EdgeInsets.symmetric(horizontal: size.width * .075),
            child: CustomTextfieldWelcomeTheme(
              hintText: 'Password',
              keyboardType: TextInputType.visiblePassword,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.width * .05),
            padding: EdgeInsets.symmetric(horizontal: size.width * .075),
            child: CustomTextfieldWelcomeTheme(
              hintText: 'Kode Referal',
              keyboardType: TextInputType.number,
            ),
          ),
          CustomSubmitWelcomeTheme(teks: 'Masuk', fungsi: () {}),
        ],
      ),
    );
  }
}
