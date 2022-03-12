import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movie_app/business_logic/controllers/login_controller.dart';
import 'package:movie_app/presentation/common_widgets/loading_dialog.dart';
import 'package:movie_app/presentation/login_screen/login_screen.dart';
import 'package:movie_app/presentation/now_playing_screen/now_playing.dart';
import 'package:movie_app/presentation/watch_list/watch_list_screen.dart';
import 'package:movie_app/utils/app_binding.dart';
import 'constants/screens_names.dart';

void main() {
  GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movie App',
      home: FutureBuilder(
        future: isUserLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              !snapshot.hasData) {
            return const LoadingDialog(dialogText: "Loading");
          }
          return snapshot.data == true ? NowPlayingScreen() : LoginScreen();
        },
      ),
      getPages: [
        GetPage(
          name: Screens.nowPlayingScreen,
          page: () => NowPlayingScreen(),
          binding: AppBinding(),
        ),
        GetPage(
          name: Screens.watchListScreen,
          page: () => const WatchListScreen(),
        ),
        GetPage(
            name: Screens.loginScreen,
            page: () => LoginScreen(),
            binding: AppBinding()),
      ],
      initialBinding: AppBinding(),
    );
  }
}

Future<bool> isUserLoggedIn() async {
  log('get user sessino ***');
  final LoginController controller = Get.find();
  await controller.getUserBySession();
  log('get user after sessino ***');

  if (controller.userExists()) {
    log('****** user FOUNDDD ***');
    return true;
  }
  return false;
}
