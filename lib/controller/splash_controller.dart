import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulangan1_11pplg2/data/data_todo.dart';
import 'package:ulangan1_11pplg2/data/db_helper.dart';
import 'package:ulangan1_11pplg2/routes/app_routes.dart';

class SplashController extends GetxController {
  final DataTodo dataTodo = Get.find<DataTodo>();

  final _dbhelper = DbHelper();

  @override
  void onInit() {
    super.onInit();
    fetchData();
    print(_dbhelper.printAllData());
  }

  Future<void> fetchData() async {
    await _dbhelper.initDatabase;
    final data = await _dbhelper.getList();
    dataTodo.toDoItem.assignAll(data);
    await Future.delayed(const Duration(seconds: 3));
    checkIsLogin();
  }

  void checkIsLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('username') != null &&
        prefs.getString('password') != null) {
      Get.offAllNamed(AppRoutes.navbarPageMobile);
      Get.offAllNamed(AppRoutes.navbarPageWide);
    } else {
      Get.offAllNamed(AppRoutes.loginPage);
    }
  }
}
