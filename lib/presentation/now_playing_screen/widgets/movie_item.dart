import 'package:flutter/material.dart';
import 'package:movie_app/constants/api.dart';

import '../../../data/models/Movie.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;
  const MovieItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.red,
      child: GridTile(
        child: FadeInImage(
          image: NetworkImage(ApiConstants.imagesUrl + movie.posterPath!),
          placeholder: AssetImage('assets/images/tmdb.png'),
        ),
      ),
    );
  }
}
