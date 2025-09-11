import 'package:get/route_manager.dart';
import 'package:ulangan1_11pplg2/bindings/login_binding.dart';
import 'package:ulangan1_11pplg2/bindings/navbar_binding.dart';
import 'package:ulangan1_11pplg2/navbar/navbar_page.dart';
import 'package:ulangan1_11pplg2/pages/add_task_pade.dart';
import 'package:ulangan1_11pplg2/pages/home_page.dart';
import 'package:ulangan1_11pplg2/pages/list_task_page.dart';
import 'package:ulangan1_11pplg2/pages/login_page.dart';
import 'package:ulangan1_11pplg2/routes/app_routes.dart';

class AppPages {
  static final appPages = [
    GetPage(
      name: AppRoutes.loginPage,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(name: AppRoutes.homePage, page: () => HomePage()),
    GetPage(
      name: AppRoutes.navbarPage,
      page: () => NavbarPage(),
      binding: NavbarBinding(),
    ),
    GetPage(
      name: AppRoutes.listtaskPage,
      page: () => ListTaskPage(),
    ),
    GetPage(
      name: AppRoutes.addtaskPage,
      page: () => AddTaskPage(),
    ),
  ];
}
