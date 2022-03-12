import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movie_app/business_logic/controllers/login_controller.dart';
import 'package:movie_app/constants/api.dart';
import 'package:movie_app/presentation/common_widgets/loading_dialog.dart';
import 'package:movie_app/presentation/login_screen/login_screen.dart';
import 'package:movie_app/presentation/now_playing_screen/now_playing.dart';
import 'package:movie_app/utils/app_binding.dart';
import 'package:movie_app/utils/storage.dart';

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
          if (snapshot.hasData) {
            return snapshot.data == true
                ? const NowPlayingScreen()
                : LoginScreen();
          }
          return const LoadingDialog(dialogText: "Loading");
        },
      ),
      getPages: [
        GetPage(
          name: Screens.nowPlayingScreen,
          page: () => const NowPlayingScreen(),
        ),
      ],
      initialBinding: AppBinding(),
    );
  }
}

Future<bool> isUserLoggedIn() async {
  LoginController controller = Get.find();
  await controller.getUserBySession();
  if (controller.userExists()) {
    log('****** user FOUNDDD ***');
    return true;
  }
  return false;
}
