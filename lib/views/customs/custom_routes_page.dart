import 'package:apk_kasir_by_dante/views/dashboards/dashboard_important_page.dart';
import 'package:apk_kasir_by_dante/views/laporans/laporan_important_page.dart';
import 'package:apk_kasir_by_dante/views/produks/produk_important_page.dart';
import 'package:apk_kasir_by_dante/views/settings/settings_body_page.dart';
import 'package:apk_kasir_by_dante/views/tranksaksis/tranksaksi_detail_page.dart';
import 'package:apk_kasir_by_dante/views/tranksaksis/tranksaksi_important_page.dart';
import 'package:apk_kasir_by_dante/views/welcome/login_page.dart';
import 'package:apk_kasir_by_dante/views/welcome/welcome_page.dart';
import 'package:get/route_manager.dart';

class CustomRoutesPage {
  // Welcome Section
  static const welcome = '/welcome';
  static const login = '/login';

  // Dashboard Section
  static const dashboardImportant = '/dashboard_important';

  // Setting Section
  static const settingBody = '/setting_body';

  // Tranksaksi Section
  static const tranksaksiImportant = '/tranksaksi_important';
  static const tranksaksiDetail = '/tranksaksi_detail';

  // Laporan Tranksaksi Section
  static const laporanImportant = '/laporan_important';

  // Produk Section
  static const produkImportant = '/produk_important';

  static final pages = [
    // Welcome Page
    GetPage(name: welcome, page: () => WelcomePage()),
    GetPage(
      name: login,
      page: () => LoginPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),

    // Dashboard Page
    GetPage(
      name: dashboardImportant,
      page: () => DashboardImportantPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),

    // Setting Page
    GetPage(
      name: settingBody,
      page: () => SettingsBodyPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 200),
    ),

    // Tranksaksi Page
    GetPage(
      name: tranksaksiImportant,
      page: () => TranksaksiImportantPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: tranksaksiDetail,
      page: () => TranksaksiDetailPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 200),
    ),

    // Laporan Page
    GetPage(
      name: laporanImportant,
      page: () => LaporanImportantPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 200),
    ),

    // Produk Page
    GetPage(
      name: produkImportant,
      page: () => ProdukImportantPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 200),
    ),
  ];
}
