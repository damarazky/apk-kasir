import 'package:apk_kasir_by_dante/views/dashboard/dashboard_important_page.dart';
import 'package:apk_kasir_by_dante/views/settings/settings_body_page.dart';
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


  static final pages = [
    GetPage(name: welcome, page: () => WelcomePage()),
    GetPage(
      name: login,
      page: () => LoginPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: dashboardImportant,
      page: () => DashboardImportantPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
     GetPage(
      name: settingBody,
      page: () => SettingsBodyPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 200),
    ),
  ];
}
