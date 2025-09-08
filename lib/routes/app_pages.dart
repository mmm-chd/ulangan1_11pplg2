import 'package:get/route_manager.dart';
import 'package:ulangan1_11pplg2/bindings/login_binding.dart';
import 'package:ulangan1_11pplg2/pages/login_page.dart';
import 'package:ulangan1_11pplg2/routes/app_routes.dart';

class AppPages {
  static final appPages = [
    GetPage(
      name: AppRoutes.loginPage,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
