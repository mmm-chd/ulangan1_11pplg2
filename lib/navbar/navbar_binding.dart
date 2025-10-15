import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/controller/add_edit_task_controller.dart';
import 'package:ulangan1_11pplg2/controller/history_controller.dart';
import 'package:ulangan1_11pplg2/controller/home_controller.dart';
import 'package:ulangan1_11pplg2/controller/task_menu_controller.dart';
import 'package:ulangan1_11pplg2/data/data_todo.dart';
import 'package:ulangan1_11pplg2/navbar/navbar_controller.dart';
import 'package:ulangan1_11pplg2/controller/profile_controller.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavbarController>(() => NavbarController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
    Get.lazyPut<HistoryController>(() => HistoryController(), fenix: true);
    Get.lazyPut<DataTodo>(() => DataTodo(), fenix: true);
    Get.lazyPut<TaskMenuController>(() => TaskMenuController(), fenix: true);
    Get.lazyPut<AddEditTaskController>(
      () => AddEditTaskController(),
      fenix: true,
    );
  }
}
