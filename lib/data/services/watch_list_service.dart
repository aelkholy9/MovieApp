import 'dart:developer';

import 'package:movie_app/utils/api_helper.dart';
import 'package:dio/dio.dart';

import '../../constants/api.dart';

class WatchListService {
  final ApiHelper _apiHelper = ApiHelper();

  Future<Response?> getWatchList(int userId, String sessionId) async {
    try {
      final queryParameters = {
        ApiParameters.apiKey: ApiConstants.apiKey,
        ApiParameters.sessionId: sessionId,
      };
      return await _apiHelper.get(
          ApiConstants.getWatchListUrl(userId), queryParameters);
    } catch (error) {
      log('error: $error');
    }
    return null;
  }

  Future<Response?> addMovieToList(
      {required int userId,
      required String sessionId,
      required int mediaId}) async {
    try {
      final queryParameters = {
        ApiParameters.apiKey: ApiConstants.apiKey,
        ApiParameters.sessionId: sessionId,
      };
      final body = {
        "media_type": "movie",
        "media_id": mediaId,
        "watchlist": true
      };
      return await _apiHelper.post(
          ApiConstants.addToWatchListUrl(userId), body, queryParameters);
    } catch (error) {
      log('error: $error');
    }
    return null;
  }

}
