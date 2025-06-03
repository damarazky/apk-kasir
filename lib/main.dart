import 'package:apk_kasir_by_dante/views/customs/custom_routes_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kasir Dante',
      getPages: CustomRoutesPage.pages,
      initialRoute: CustomRoutesPage.welcome,
    );
  }
}
