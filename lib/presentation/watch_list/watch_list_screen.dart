import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/business_logic/controllers/watch_list_controller.dart';
import 'package:movie_app/constants/colors.dart';
import 'package:movie_app/presentation/now_playing_screen/widgets/movie_item.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Watch List"),
        backgroundColor: AppColors.primaryColor,
      ),
      body: moviesGrid(),
    );
  }
}

Widget moviesGrid() {
  return GetBuilder<WatchListController>(
    builder: (controller) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        itemBuilder: (context, index) {
          return MovieItem(movie: controller.watchList[index]);
        },
        itemCount: controller.watchList.length,
      );
    },
  );
}
