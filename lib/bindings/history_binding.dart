import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/controller/history_controller.dart';
import 'package:ulangan1_11pplg2/controller/task_menu_controller.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryController>(() => HistoryController(), fenix: true);
    Get.lazyPut<TaskMenuController>(() => TaskMenuController(), fenix: true);
  }
}
