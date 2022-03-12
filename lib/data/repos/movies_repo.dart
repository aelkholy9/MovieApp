import 'dart:developer';

import 'package:movie_app/data/services/movie_service.dart';

class MovieRepository {
  final MovieService _movieService = MovieService();

  Future<List<dynamic>> getMovies([int pageNumber = 1]) async {
    try {
      final dataMap = await _movieService.getMovies(pageNumber);
      final List<dynamic> movieResults = dataMap?.data['results'];
      return movieResults;
    } catch (e) {
      log('error in get movies repo: $e');
      return [];
    }
  }
}
