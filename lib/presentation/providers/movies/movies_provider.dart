import 'package:get/get.dart';
import 'package:new_app/domain/entities/movie.dart';
import 'package:new_app/domain/repositories/movies_repository.dart';

class MoviesProvider extends GetxController {
  final MoviesRepository moviesRepository;
  final RxList<Movie> movies = <Movie>[].obs;

  MoviesProvider({required this.moviesRepository});

  @override
  void onInit() {
    super.onInit();
    loadPage();
  }

  Future<void> loadPage() async {
    movies.clear();

    final data = await moviesRepository.getLatestMovies(page: 1);

    movies.addAll(data);
  }
}
