import 'package:get/get.dart';
import 'package:movie_app/business_logic/controllers/login_controller.dart';
import 'package:movie_app/business_logic/controllers/now_playing_controller.dart';
import 'package:movie_app/business_logic/controllers/watch_list_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController(), permanent: true);
    Get.put<NowPlayingController>(NowPlayingController(), permanent: true);
    Get.lazyPut<WatchListController>(() => WatchListController(), fenix: true);
  }
}
