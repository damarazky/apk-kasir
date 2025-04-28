import 'package:apk_kasir_by_dante/views/welcome/login_page.dart';
import 'package:apk_kasir_by_dante/views/welcome/welcome_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/route_manager.dart';

class CustomRoutesPage {
  static const welcome = '/welcome';
  static const login = '/login';

  static final pages = [
    GetPage(name: welcome, page: () => WelcomePage()),
    GetPage(
      name: login,
      page: () => LoginPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
  ];
}
