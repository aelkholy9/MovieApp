import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/business_logic/controllers/login_controller.dart';
import 'package:movie_app/constants/api.dart';

import '../../../data/models/Movie.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;
  MovieItem({Key? key, required this.movie}) : super(key: key);
  final LoginController _loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: GridTile(
        header: Container(
          height: 30,
          child: _loginController.userExists()
              ? Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.add_box,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                  ],
                )
              : Container(),
        ),
        child: Stack(
          children: [
            FadeInImage(
              image: NetworkImage(ApiConstants.imagesUrl + movie.posterPath!),
              placeholder: const AssetImage('assets/images/loading.gif'),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black54,
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Text(
                  movie.overview!,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white),
                  maxLines: 5,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        footer: Container(
          height: 40,
          color: Colors.black54,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    movie.title!,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
