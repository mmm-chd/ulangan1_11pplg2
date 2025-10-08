import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulangan1_11pplg2/data/data_todo.dart';
import 'package:ulangan1_11pplg2/routes/app_routes.dart';

class ProfileController extends GetxController {
  final DataTodo dataTodo = Get.find<DataTodo>();

  Rx<DateTime> dateNow = DateTime.now().obs;
  RxBool complete = false.obs;
  RxBool completed = true.obs;

  int get totalTasks {
    return dataTodo.toDoItem
        .where((item) => item.isCompleted == complete.value)
        .length;
  }

  int get todayTasks {
    return dataTodo.toDoItem
        .where(
          (item) =>
              item.date.year == dateNow.value.year &&
              item.date.month == dateNow.value.month &&
              item.date.day == dateNow.value.day &&
              item.isCompleted == complete.value,
        )
        .length;
  }

  int get completedTasks {
    return dataTodo.toDoItem
        .where((item) => item.isCompleted == completed.value)
        .length;
  }

    void signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("username");
    Get.offAllNamed(AppRoutes.splashPage);
  }
}
