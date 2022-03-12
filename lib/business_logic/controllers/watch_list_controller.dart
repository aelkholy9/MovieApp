import 'package:get/get.dart';
import 'package:movie_app/constants/api.dart';
import 'package:movie_app/data/repos/watch_list_repo.dart';
import '../../data/models/Movie.dart';

class WatchListController extends GetxController {
  List<Movie> watchList = [];
  final WatchListRepository _watchListRepository = WatchListRepository();
  bool loadingMovies = true;
  @override
  void onInit() async {
    await getWatchList();
    super.onInit();
  }

  Future<void> getWatchList() async {
    final List moviesDataList = await _watchListRepository.getWatchList();
    watchList = moviesDataList.map((movie) => Movie.fromJson(movie)).toList();
    loadingMovies = false;
    update();
  }

  Future<bool> addMovieToWatchList({required Movie movie}) async {
    final addMovieDataMap =
        await _watchListRepository.addMovieToWatchList(movie.id!);
    if (addMovieDataMap[ApiParameters.success]) {
      watchList.add(movie);
      loadingMovies = false;
      update();
      return true;
    }
    return false;
  }

  Future<bool> removeMovieFromList({required Movie movie}) async {
    final addMovieDataMap =
        await _watchListRepository.removeMovieFromList(movie.id!);
    if (addMovieDataMap[ApiParameters.success]) {
      watchList.removeWhere((currentMovie) => currentMovie.id == movie.id);
      loadingMovies = false;
      update();
      return true;
    }
    return false;
  }
}
