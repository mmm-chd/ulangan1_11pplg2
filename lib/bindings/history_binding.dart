import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/controller/history_controller.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryController>(() => HistoryController());
  }
  
}