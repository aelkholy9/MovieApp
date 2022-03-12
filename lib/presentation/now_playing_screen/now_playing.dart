import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/business_logic/controllers/login_controller.dart';
import 'package:movie_app/business_logic/controllers/now_playing_controller.dart';
import 'package:movie_app/constants/colors.dart';
import 'package:movie_app/presentation/login_screen/login_screen.dart';
import 'package:movie_app/presentation/now_playing_screen/widgets/movie_item.dart';

import '../../constants/screens_names.dart';

class NowPlayingScreen extends StatelessWidget {
   NowPlayingScreen({Key? key}) : super(key: key);
  final LoginController _loginController = LoginController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Now playing"),
        backgroundColor: AppColors.primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Screens.watchListScreen);
            },
            icon: const Icon(
              Icons.lock_clock,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              _loginController.signOut();
              Get.offNamed(Screens.loginScreen);
            },
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: moviesGrid(),
    );
  }
}

Widget moviesGrid() {
  return GetBuilder<NowPlayingController>(
    builder: (controller) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        itemBuilder: (context, index) {
          return MovieItem(movie: controller.movies[index]);
        },
        itemCount: controller.movies.length,
      );
    },
  );
}
