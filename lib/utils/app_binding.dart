import 'package:get/get.dart';
import 'package:movie_app/business_logic/controllers/login_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
