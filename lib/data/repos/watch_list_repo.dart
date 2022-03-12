import 'dart:developer';
import 'package:get/get.dart';
import 'package:movie_app/constants/api.dart';
import 'package:movie_app/data/services/watch_list_service.dart';
import 'package:movie_app/utils/storage.dart';

import '../../business_logic/controllers/login_controller.dart';

class WatchListRepository {
  final WatchListService _watchListService = WatchListService();
  final LoginController loginController = Get.find();
  Future<List<dynamic>> getWatchList() async {
    try {
      final sessionId = await LocalStorage.get(ApiParameters.sessionId);
      final dataMap = await _watchListService.getWatchList(
          loginController.getUser!.id!, sessionId);
      final List<dynamic> movieResults = dataMap?.data['results'];
      return movieResults;
    } catch (e) {
      log('error in get watch list repo: $e');
      return [];
    }
  }

  Future<Map<String, dynamic>> addMovieToWatchList(int mediaId) async {
    try {
      final sessionId = await LocalStorage.get(ApiParameters.sessionId);
      final dataMap = await _watchListService.addMovieToList(
          mediaId: mediaId,
          sessionId: sessionId,
          userId: loginController.getUser!.id!);
      return dataMap?.data;
    } catch (e) {
      log('error in get watch list repo: $e');
      return {};
    }
  }
}
