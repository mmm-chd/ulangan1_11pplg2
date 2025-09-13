import 'package:get/get.dart';
import 'package:ulangan1_11pplg2/controller/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
  
}