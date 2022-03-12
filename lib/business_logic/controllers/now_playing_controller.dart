import 'package:get/get.dart';
import 'package:movie_app/data/repos/movies_repo.dart';
import '../../data/models/Movie.dart';

class NowPlayingController extends GetxController {
  List<Movie> movies = [];
  final MovieRepository _movieRepository = MovieRepository();

  @override
  void onInit() async {
    super.onInit();
    await getMovies();
    update();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<void> getMovies() async {
    final List moviesDataList = await _movieRepository.getMovies();
    movies = moviesDataList.map((movie) => Movie.fromJson(movie)).toList();
    update();
  }
}
