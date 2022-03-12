import 'dart:developer';

import '../../constants/api.dart';
import '../../utils/api_helper.dart';
import 'package:dio/dio.dart';

class MovieService {
  ApiHelper apiHelper = ApiHelper();

  Future<Response?> getMovies([pageNumber = 1]) async {
    try {
      final queryParameter =
          ApiConstants.constructParametersWithPageNumber(pageNumber);
      return await apiHelper.get(
          ApiConstants.nowPlayingMoviesUrl, queryParameter);
    } catch (error) {
      log('error: $error');
    }
    return null;
  }
}
