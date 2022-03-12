import 'dart:developer';

import 'package:movie_app/data/services/movie_service.dart';

class MovieRepository {
  final MovieService _movieService = MovieService();

  Future<List<dynamic>> getMovies() async {
    try {
      final dataMap = await _movieService.getMovies();
      final List<dynamic> movieResults = dataMap?.data['results'];
      return movieResults;
    } catch (e) {
      log('error in get movies repo: $e');
      return [];
    }
  }
}
