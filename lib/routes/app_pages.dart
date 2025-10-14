import 'package:get/route_manager.dart';
import 'package:ulangan1_11pplg2/bindings/add_task_binding.dart';
import 'package:ulangan1_11pplg2/bindings/history_binding.dart';
import 'package:ulangan1_11pplg2/bindings/home_binding.dart';
import 'package:ulangan1_11pplg2/bindings/list_task_binding.dart';
import 'package:ulangan1_11pplg2/bindings/login_binding.dart';
import 'package:ulangan1_11pplg2/bindings/splash_binding.dart';
import 'package:ulangan1_11pplg2/navbar/navbar_binding.dart';
import 'package:ulangan1_11pplg2/navbar/navbar_page.dart';
import 'package:ulangan1_11pplg2/pages/AddTaskListPage/add_task_page.dart';
import 'package:ulangan1_11pplg2/pages/HistoryPage/history_page.dart';
import 'package:ulangan1_11pplg2/pages/HomePage/home_page.dart';
import 'package:ulangan1_11pplg2/pages/HomePage/home_page_widescreen.dart';
import 'package:ulangan1_11pplg2/pages/ListTaskPage/list_task_page.dart';
import 'package:ulangan1_11pplg2/pages/LoginPage/login_page.dart';
import 'package:ulangan1_11pplg2/pages/ProfilePage/profile_page.dart';
import 'package:ulangan1_11pplg2/pages/splash_page.dart';
import 'package:ulangan1_11pplg2/routes/app_routes.dart';

class AppPages {
  static final appPages = [
    GetPage(
      name: AppRoutes.loginPage,
      page: () => LoginPage(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.homePage,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.navbarPage,
      page: () => NavbarPage(),
      binding: NavbarBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.homePageWide,
      page: () => HomePageWide(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.listtaskPage,
      page: () => ListTaskPage(),
      binding: ListTaskBinding(),
    ),
    GetPage(
      name: AppRoutes.addtaskPage,
      page: () => AddTaskPage(),
      binding: AddTaskBinding(),
    ),
    GetPage(name: AppRoutes.profilePage, page: () => ProfilePage()),
    GetPage(
      name: AppRoutes.historyPage,
      page: () => HistoryPage(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: AppRoutes.splashPage,
      page: () => SplashPage(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
  ];
}
